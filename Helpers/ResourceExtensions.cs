using Microsoft.Windows.ApplicationModel.Resources;

namespace RyTuneX.Helpers;

public static class ResourceExtensions
{
    private static ResourceLoader? _resourceLoader;
    private static bool _resourceLoaderUnavailable;

    private static ResourceLoader? GetResourceLoader()
    {
        if (_resourceLoader is not null)
        {
            return _resourceLoader;
        }

        if (_resourceLoaderUnavailable)
        {
            return null;
        }

        try
        {
            _resourceLoader = new ResourceLoader();
            return _resourceLoader;
        }
        catch
        {
            // A missing or unreadable resource file must not take down a page constructor.
            _resourceLoaderUnavailable = true;
            return null;
        }
    }

    public static string GetLocalized(this string resourceKey)
    {
        try
        {
            var loader = GetResourceLoader();
            if (loader is not null)
            {
                // WinAppSDK ResourceLoader uses '/' as the path delimiter, not '.'.
                // Keys like "PageName_Control.Text" must be looked up as "PageName_Control/Text".
                var lookupKey = resourceKey.Contains('.') ? resourceKey.Replace('.', '/') : resourceKey;
                var value = loader.GetString(lookupKey);
                if (!string.IsNullOrEmpty(value))
                {
                    return value;
                }
            }
        }
        catch
        {
            // Fall through to the key so a missing string never aborts startup.
        }

        return resourceKey;
    }

    // Tries to get a localized string, returning null if the resource is not found.
    // Handles both dot format (Feature.Header) and slash format (Feature/Header).

    public static string? TryGetLocalized(this string resourceKey)
    {
        var loader = GetResourceLoader();
        if (loader is null)
        {
            return null;
        }

        try
        {
            var value = loader.GetString(resourceKey);
            if (!string.IsNullOrEmpty(value))
            {
                return value;
            }
        }
        catch
        {
            // Resource not found with original key
        }

        // Try converting slash to dot or vice versa
        try
        {
            string altKey;
            if (resourceKey.Contains('/'))
            {
                altKey = resourceKey.Replace('/', '.');
            }
            else if (resourceKey.Contains('.'))
            {
                altKey = resourceKey.Replace('.', '/');
            }
            else
            {
                return null;
            }

            var value = loader.GetString(altKey);
            return string.IsNullOrEmpty(value) ? null : value;
        }
        catch
        {
            return null;
        }
    }
}
