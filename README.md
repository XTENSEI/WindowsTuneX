# Hyperion Optimizer

A Windows tuning and debloating tool built with WinUI 3 and .NET 10.

Hyperion Optimizer is a modified fork of [RyTuneX](https://github.com/rayenghanmi/RyTuneX)
by Rayen Ghanmi, used under the GNU Affero General Public License v3.0.
This fork is not affiliated with or endorsed by the original author.

## Install

Download `HyperionOptimizer-Setup.exe` from the latest release and run it. It requests
administrator rights, trusts the package certificate, installs the Windows App Runtime
dependency when needed, registers the app, and opens it.

Manual install, if you prefer:

```powershell
Import-Certificate -FilePath HyperionOptimizer.cer -CertStoreLocation Cert:\LocalMachine\TrustedPeople
Add-AppxPackage -Path .\HyperionOptimizer.msix
```

The Windows App Runtime 2.5.1 package from `HyperionOptimizer-dependencies-x64.zip` must be
installed first. The MSIX is self-signed. Uninstall an earlier build before installing a
newer one, because each build carries a new certificate.

Prefer no installer? Unzip the portable package and run `Hyperion.exe`. It still requests
administrator rights, because every optimization writes to machine-wide registry and
service state.

## Why Hyperion Optimizer?

- **Precision System Tuning**: Deep OS-level configuration to maximize responsiveness, speed, and reliability.
- **Complete Control**: Granular management over system services, processes, packages, telemetry, and policies.

## Core Capabilities

- 🧠 **Intelligent Tuning Engine**: Hardware-aware recommendations, domain-specific scoring (Performance, Privacy, Features), risk classification badges (`Safe`, `Cosmetic`, `Moderate`, `Caution`), on-demand technical inspection flyouts, and per-item rollback.
- ⚡ **Low-Level Latency & OS Tuning**: Fine-tune timer resolution, HPET, dynamic tick, memory caching, power throttling, and GPU/input latency alongside automated post-Windows Update re-application.
- 🔥 **Multi-Threaded Stress Engine**: Built-in stability and thermal testing across CPU, RAM, and GPU compute workloads with real-time hardware telemetry, thread allocation controls, and emergency thermal cutoffs.
- 🧹 **Debloating & Deep Clean Engine**: Remove pre-installed UWP/Win32 bloatware via native Windows Deployment APIs and reclaim disk space across 12 targeted caches (Shader Cache, Windows Update, Crash Dumps, Browsers, Prefetch).
- 🛡️ **Privacy & AI Hardening**: Lock down OS telemetry, activity history, launch tracking, Copilot+ AI features, Windows Recall, and background data collection.
- 🌐 **Network & Stack Optimization**: Configure custom DNS profiles and tune TCP/IP performance (`Nagle's Algorithm`, `RSS`, `ECN`, `CTCP`, `Network Throttling`, `NetBIOS`).
- 🧰 **Unified System Management**: Control Startup Apps (COM Task Scheduler & Registry), active Processes, Windows Services, 27+ Group Policy categories, Security status, and WinGet packages.
- 🚀 **Native AOT & WinUI 3 Architecture**: Compiled directly to native machine code (x64 Native AOT / x86 R2R) on .NET 10 and Windows App SDK 2.5.1 for near-instant startup and minimal memory footprint.

## Technical Architecture

Hyperion Optimizer keeps the layered architecture of its upstream project for native speed,
low overhead, and maintainability:

<p align="center">
  <img src="https://img.shields.io/badge/WinUI%203-0078D4?style=flat-square&logo=windows&logoColor=white" alt="WinUI 3" />
  <img src="https://img.shields.io/badge/Windows_App_SDK-2.5.1-0078D4?style=flat-square&logo=windows&logoColor=white" alt="Windows App SDK 2.5.1" />
  <img src="https://img.shields.io/badge/C%23-14-239120?style=flat-square&logo=c-sharp&logoColor=white" alt="C# 14" />
  <img src="https://img.shields.io/badge/.NET_10-Native_AOT-512BD4?style=flat-square&logo=dotnet&logoColor=white" alt=".NET 10 Native AOT" />
  <img src="https://img.shields.io/badge/Windows_PowerShell-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="PowerShell" />
</p>

- 🖥️ **UI Framework**: Native rendering with **WinUI 3** and **Windows App SDK 2.5.1**, featuring XAML rendering optimizations (`DefaultStyleOptimizations`, `IconNoGridOptimization`), native `<TitleBar>` chrome, Mica/Acrylic backdrops, and custom accent personalization.
- ⚙️ **Native Compilation**: Written in **C# 14** on **.NET 10**, utilizing **Native AOT** (x64) and **ReadyToRun + ILLink Trimming** (x86) for self-contained deployment, zero JIT overhead, and sub-2-second cold startups.
- 🔗 **Dynamic Engine & Service Layer**: Powered by decoupled services (`IntelligentOptimizationEngine`, `OptimizeFunctionInspector`, `StressEngine`, `DeepCleanEngine`) for dynamic runtime code inspection, pre-warmed state caching, and asynchronous execution.
- 🔧 **Deep OS Interop**: Direct platform execution via **Win32 APIs (P/Invoke)**, **Windows Deployment API**, **COM (`Schedule.Service`)**, **WMI**, and **PowerShell** for registry tuning, native UWP/Win32 debloating, policy scanning, and WinGet management.
- 🔒 **Atomic State & Rollback**: Real-time registry state detection (`SystemStateDetector`) paired with granular **per-item rollback** and a 1-click **Revert All Changes** failsafe.

## Usage Guide

> [!WARNING]
> Always create a system restore point before applying deep system tuning changes.

- **🏠 Home**: Monitor real-time CPU, GPU, RAM, Disk, and Network usage graphs alongside quick system actions.
- **⚡ Optimize**: Apply hardware-aware performance, memory, power, and timer/latency tweaks using preset filters (`Recommended`, `Safe`, `Moderate`), risk badges, and per-item rollback.
- **🧹 Debloat & Deep Clean**: Uninstall pre-installed UWP/Win32 apps in bulk and run asynchronous **Deep Clean** scans across 12 system, browser, and GPU shader cache targets.
- **🛡️ Privacy**: Harden Windows against telemetry, activity history, launch tracking, web search injection, and background data collection.
- **⚙️ Features**: Customize context menus (`Take Ownership`, `Copy File Path`), notification behavior, taskbar layouts, and disable Windows AI, Copilot, and Recall components.
- **🔥 Stress Test**: Benchmark CPU, RAM, and GPU stability under sustained loads with customizable thread allocation, real-time thermal telemetry, and emergency temperature cutoffs.
- **🌐 Network & Security**: Apply low-latency TCP/IP network stack tweaks (`Nagle's Algorithm`, `RSS`, `ECN`, `CTCP`), assign custom DNS presets, and audit real-time Windows Defender, Firewall, BitLocker, and SmartScreen states.
- **🧰 System Workloads**: Manage boot entries in **Startup Apps**, install software via **Packages (WinGet)**, clear overrides across 27+ categories in **Policies**, control live **Processes** and **Services**, and run system repair routines in **Repair**.
- **📊 System Info**: Inspect detailed hardware specifications, battery health, Copilot+ AI hardware capabilities, and extract or import device drivers.

## Build from source

The project targets `net10.0-windows10.0.26100.0` and needs the .NET 10 SDK, the Windows App
SDK, and MSIX tooling. It builds only on Windows. The GitHub Actions workflow in
[.github/workflows/build.yml](.github/workflows/build.yml) is the reference build: it produces
the signed MSIX and the portable archive on every push.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Changes to the upstream project belong upstream, not
in this fork.

## Translation

### Supported languages

<div align="center">
  <p style="font-size: 1.1rem; line-height: 2;">
    🇺🇸 <strong>English (US)</strong> &nbsp;&bull;&nbsp; 🇫🇷 <strong>French</strong> &nbsp;&bull;&nbsp; 🇹🇳 <strong>Arabic</strong> &nbsp;&bull;&nbsp; 🇨🇳 <strong>Simplified Chinese</strong> &nbsp;&bull;&nbsp; 🇹🇼 <strong>Traditional Chinese</strong> &nbsp;&bull;&nbsp; 🇩🇪 <strong>German</strong> &nbsp;&bull;&nbsp; 🇯🇵 <strong>Japanese</strong> <br> 🇷🇺 <strong>Russian</strong> &nbsp;&bull;&nbsp; 🇪🇸 <strong>Spanish</strong> &nbsp;&bull;&nbsp; 🇰🇷 <strong>Korean</strong> &nbsp;&bull;&nbsp; 🇧🇷 <strong>Portuguese (BR)</strong> &nbsp;&bull;&nbsp; 🇮🇹 <strong>Italian</strong> &nbsp;&bull;&nbsp; 🇹🇷 <strong>Turkish</strong> &nbsp;&bull;&nbsp; 🇮🇱 <strong>Hebrew</strong> &nbsp;&bull;&nbsp; 🇻🇳 <strong>Vietnamese</strong> &nbsp;&bull;&nbsp; 🇮🇩 <strong>Indonesian</strong>
  </p>
</div>

### Add your language

1. **Clone the file**: Copy [Strings/en-us/Resources.resw](Strings/en-us/Resources.resw).
2. **Translate it**: Translate the values into your target language.
3. **Save it**: Put the file in `Strings/<language-code>/Resources.resw`, for example `fr-fr`.
4. **Open a pull request**: Submit it against `main` in this repository.

## License

This project is licensed under the [GNU Affero General Public License v3.0](LICENSE.md).
See [NOTICE](NOTICE) for the upstream attribution.

## Upstream

Based on RyTuneX by Rayen Ghanmi: <https://github.com/rayenghanmi/RyTuneX>.
That project has its own releases, support channels, and issue tracker.
