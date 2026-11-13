#define AppName "Hyperion Optimizer"
#define AppVersion "1.0.1"
#define AppPublisher "Hyperion Optimizer Contributors"
#define AppURL "https://github.com/XTENSEI/WindowsTuneX"

[Setup]
AppId={{6F1D3B2A-9C4E-4B77-9A61-2E5D8C7F0A13}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}/issues
AppUpdatesURL={#AppURL}/releases
DefaultDirName={autopf}\Hyperion Optimizer
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=Output
OutputBaseFilename=HyperionOptimizer-Setup
SetupIconFile=..\Assets\WindowIcon.ico
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0.19041

[Files]
Source: "..\out\HyperionOptimizer.msix"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
Source: "..\out\HyperionOptimizer.cer"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
Source: "..\out\Dependencies\x64\*"; DestDir: "{app}\Dependencies"; Flags: ignoreversion deleteafterinstall
Source: "install.ps1"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Run]
Filename: "{sys}\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{tmp}\install.ps1"" -AppDir ""{app}"""; StatusMsg: "Installing Hyperion Optimizer..."; Flags: runhidden waituntilterminated

[UninstallRun]
Filename: "{sys}\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -Command ""Get-AppxPackage -Name HyperionOptimizer.Hyperion | Remove-AppxPackage -ErrorAction SilentlyContinue"""; Flags: runhidden waituntilterminated
