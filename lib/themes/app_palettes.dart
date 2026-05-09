import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neostation/providers/palette_provider.dart';

// Import all individual themes
import 'nsdark_palette.dart' as nsdark;
import 'nslight_palette.dart' as nslight;
import 'oled_palette.dart' as oled;
import 'valentine_palette.dart' as valentine;
import 'rgc_palette.dart' as rgc;
import 'tw_dark_palette.dart' as tw_dark;
import 'dracula_palette.dart' as dracula;
import 'nord_palette.dart' as nord;
import 'gruvbox_palette.dart' as gruvbox;
import 'tokyo_night_palette.dart' as tokyo_night;
import 'solarized_light_palette.dart' as solarized_light;
import 'one_light_palette.dart' as one_light;
import 'catppuccin_palette.dart' as catppuccin;
import 'solarized_dark_palette.dart' as solarized_dark;
import 'palenight_palette.dart' as palenight;
import 'horizon_palette.dart' as horizon;

class AppPalettes {
  static String getLogoPath(ThemeData palette) {
    // Check for specific theme instances before general brightness detection.
    if (palette == nsdarkPalette) {
      return 'assets/images/app/logo-nsdark.webp';
    } else if (palette == nslightPalette) {
      return 'assets/images/app/logo-nslight.webp';
    } else if (palette == oledPalette) {
      return 'assets/images/app/logo-oled.webp';
    } else if (palette == valentinePalette) {
      return 'assets/images/app/logo-valentine.webp';
    } else if (palette == rgcPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == twDarkPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == draculaPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == nordPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == gruvboxPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == tokyoNightPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == solarizedLightPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == oneLightPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == catppuccinPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == solarizedDarkPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == palenightPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else if (palette == horizonPalette) {
      return 'assets/images/app/logo-monochrome.webp';
    } else {
      return 'assets/images/logo_transparent.png';
    }
  }

  static String getLogoPathByName(String paletteName) {
    switch (paletteName) {
      case 'nsdark':
        return 'assets/images/logo_transparent.png';
      case 'nslight':
        return 'assets/images/logo_transparent.png';
      case 'oled':
        return 'assets/images/logo_transparent.png';
      case 'valentine':
        return 'assets/images/logo_transparent.png';
      case 'rgc':
        return 'assets/images/logo_transparent.png';
      case 'tw_dark':
        return 'assets/images/logo_transparent.png';
      default:
        return 'assets/images/logo_transparent.png';
    }
  }

  // References to individual themes
  static ThemeData get nsdarkPalette => nsdark.nsdarkPalette;
  static ThemeData get nslightPalette => nslight.nslightPalette;
  static ThemeData get oledPalette => oled.oledPalette;
  static ThemeData get valentinePalette => valentine.valentinePalette;
  static ThemeData get rgcPalette => rgc.rgcPalette;
  static ThemeData get twDarkPalette => tw_dark.twDarkPalette;
  static ThemeData get draculaPalette => dracula.draculaPalette;
  static ThemeData get nordPalette => nord.nordPalette;
  static ThemeData get gruvboxPalette => gruvbox.gruvboxPalette;
  static ThemeData get tokyoNightPalette => tokyo_night.tokyoNightPalette;
  static ThemeData get solarizedLightPalette =>
      solarized_light.solarizedLightPalette;
  static ThemeData get oneLightPalette => one_light.oneLightPalette;
  static ThemeData get catppuccinPalette => catppuccin.catppuccinPalette;
  static ThemeData get solarizedDarkPalette =>
      solarized_dark.solarizedDarkPalette;
  static ThemeData get palenightPalette => palenight.palenightPalette;
  static ThemeData get horizonPalette => horizon.horizonPalette;

  // References to custom colors for each theme
  static dynamic get nsdarkCustomColors => nsdark.NSdarkCustomColors();
  static dynamic get nslightCustomColors => nslight.NSlightCustomColors();
  static dynamic get oledCustomColors => oled.OledCustomColors();
  static dynamic get valentineCustomColors => valentine.ValentineCustomColors();
  static dynamic get rgcCustomColors => rgc.RGCCustomColors();
  static dynamic get twDarkCustomColors => tw_dark.TWCustomColors();
  static dynamic get draculaCustomColors => dracula.DraculaCustomColors();
  static dynamic get nordCustomColors => nord.NordCustomColors();
  static dynamic get gruvboxCustomColors => gruvbox.GruvboxCustomColors();
  static dynamic get tokyoNightCustomColors =>
      tokyo_night.TokyoNightCustomColors();
  static dynamic get solarizedLightCustomColors =>
      solarized_light.SolarizedLightCustomColors();
  static dynamic get oneLightCustomColors => one_light.OneLightCustomColors();
  static dynamic get catppuccinCustomColors =>
      catppuccin.CatppuccinCustomColors();
  static dynamic get solarizedDarkCustomColors =>
      solarized_dark.SolarizedDarkCustomColors();
  static dynamic get palenightCustomColors => palenight.PalenightCustomColors();
  static dynamic get horizonCustomColors => horizon.HorizonCustomColors();

  /// Retrieves header colors based on the current context's theme.
  static dynamic getCustomColors(BuildContext context) {
    // Prefer detection by palette name if a PaletteProvider is available (more reliable).
    try {
      final paletteProvider = Provider.of<PaletteProvider>(context, listen: false);
      final paletteName = paletteProvider.currentPaletteName;
      String resolvedThemeName = paletteName;

      if (paletteName == 'system') {
        final brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        resolvedThemeName = brightness == Brightness.dark
            ? 'nsdark'
            : 'nslight';
      }

      switch (resolvedThemeName) {
        case 'nslight':
          return nslight.NSlightCustomColors();
        case 'oled':
          return oled.OledCustomColors();
        case 'valentine':
          return valentine.ValentineCustomColors();
        case 'rgc':
          return rgc.RGCCustomColors();
        case 'tw_dark':
          return tw_dark.TWCustomColors();
        case 'dracula':
          return dracula.DraculaCustomColors();
        case 'nord':
          return nord.NordCustomColors();
        case 'gruvbox':
          return gruvbox.GruvboxCustomColors();
        case 'tokyo_night':
          return tokyo_night.TokyoNightCustomColors();
        case 'solarized_light':
          return solarized_light.SolarizedLightCustomColors();
        case 'one_light':
          return one_light.OneLightCustomColors();
        case 'catppuccin':
          return catppuccin.CatppuccinCustomColors();
        case 'solarized_dark':
          return solarized_dark.SolarizedDarkCustomColors();
        case 'palenight':
          return palenight.PalenightCustomColors();
        case 'horizon':
          return horizon.HorizonCustomColors();
        default:
          return nsdark.NSdarkCustomColors();
      }
    } catch (_) {
      // Fallback to color comparison if provider is not available.
    }

    final scheme = Theme.of(context).colorScheme;
    final surface = scheme.surface;
    final secondary = scheme.secondary;

    // Compare with surface or secondary colors of each theme.
    if (surface == nslightPalette.colorScheme.surface ||
        secondary == nslightPalette.colorScheme.secondary) {
      return nslight.NSlightCustomColors();
    } else if (surface == oledPalette.colorScheme.surface ||
        secondary == oledPalette.colorScheme.secondary) {
      return oled.OledCustomColors();
    } else if (surface == valentinePalette.colorScheme.surface ||
        secondary == valentinePalette.colorScheme.secondary) {
      return valentine.ValentineCustomColors();
    } else if (surface == rgcPalette.colorScheme.surface ||
        secondary == rgcPalette.colorScheme.secondary) {
      return rgc.RGCCustomColors();
    } else if (surface == twDarkPalette.colorScheme.surface ||
        secondary == twDarkPalette.colorScheme.secondary) {
      return tw_dark.TWCustomColors();
    } else if (surface == draculaPalette.colorScheme.surface ||
        secondary == draculaPalette.colorScheme.secondary) {
      return dracula.DraculaCustomColors();
    } else if (surface == nordPalette.colorScheme.surface ||
        secondary == nordPalette.colorScheme.secondary) {
      return nord.NordCustomColors();
    } else if (surface == gruvboxPalette.colorScheme.surface ||
        secondary == gruvboxPalette.colorScheme.secondary) {
      return gruvbox.GruvboxCustomColors();
    } else if (surface == tokyoNightPalette.colorScheme.surface ||
        secondary == tokyoNightPalette.colorScheme.secondary) {
      return tokyo_night.TokyoNightCustomColors();
    } else if (surface == solarizedLightPalette.colorScheme.surface ||
        secondary == solarizedLightPalette.colorScheme.secondary) {
      return solarized_light.SolarizedLightCustomColors();
    } else if (surface == oneLightPalette.colorScheme.surface ||
        secondary == oneLightPalette.colorScheme.secondary) {
      return one_light.OneLightCustomColors();
    } else if (surface == catppuccinPalette.colorScheme.surface ||
        secondary == catppuccinPalette.colorScheme.secondary) {
      return catppuccin.CatppuccinCustomColors();
    } else if (surface == solarizedDarkPalette.colorScheme.surface ||
        secondary == solarizedDarkPalette.colorScheme.secondary) {
      return solarized_dark.SolarizedDarkCustomColors();
    } else if (surface == palenightPalette.colorScheme.surface ||
        secondary == palenightPalette.colorScheme.secondary) {
      return palenight.PalenightCustomColors();
    } else if (surface == horizonPalette.colorScheme.surface ||
        secondary == horizonPalette.colorScheme.secondary) {
      return horizon.HorizonCustomColors();
    } else {
      return nsdark.NSdarkCustomColors();
    }
  }

  static ThemeData getPaletteDataByName(String paletteName) {
    switch (paletteName) {
      case 'nsdark':
        return nsdarkPalette;
      case 'nslight':
        return nslightPalette;
      case 'oled':
        return oledPalette;
      case 'valentine':
        return valentinePalette;
      case 'rgc':
        return rgcPalette;
      case 'tw_dark':
        return twDarkPalette;
      case 'dracula':
        return draculaPalette;
      case 'nord':
        return nordPalette;
      case 'gruvbox':
        return gruvboxPalette;
      case 'tokyo_night':
        return tokyoNightPalette;
      case 'solarized_light':
        return solarizedLightPalette;
      case 'one_light':
        return oneLightPalette;
      case 'catppuccin':
        return catppuccinPalette;
      case 'solarized_dark':
        return solarizedDarkPalette;
      case 'palenight':
        return palenightPalette;
      case 'horizon':
        return horizonPalette;
      default:
        return nsdarkPalette;
    }
  }
}
