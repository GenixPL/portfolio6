import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';

extension ThemeBuildContextExtensions on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

extension ThemeDataExtensions on ThemeData {
  Duration get basicAnimationDuration {
    return Duration(milliseconds: 300);
  }

  Curve get basicAnimationCurve {
    return Curves.ease;
  }

  Color get primary {
    return colorScheme.primary;
  }

  Color get secondary {
    return colorScheme.secondary;
  }

  double defaultPageHorizontalPadding(BuildContext context) {
    final double maxWidth = MediaQuery.sizeOf(context).width;
    if (maxWidth < 600) {
      return 16;
    }

    return 32.0;
  }

  double defaultPageVerticalPadding(BuildContext context) {
    final double maxHeight = MediaQuery.sizeOf(context).height;
    if (maxHeight < 800) {
      return 32;
    }

    return 64;
  }

  double defaultSpacing(BuildContext context) {
    return defaultPageVerticalPadding(context);
  }

  double get cardSpacing {
    return 24.0;
  }

  double get maxHorizontalCardWidth {
    return 580;
  }

  double get cornerCut {
    return 24;
  }
}

class GenTheme {
  const GenTheme();

  ThemeData build() {
    final ColorScheme colorScheme = .dark(
      surface: Color(0xFF_18_18_18),
      primary: Colors.white,
      secondary: Colors.amberAccent,
    );

    final hovered = _hoveredColor(colorScheme.secondary.withAlpha(200));

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      snackBarTheme: _snackBar(
        colorScheme: colorScheme,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: hovered,
          overlayColor: _singleColor(Colors.transparent),
        ),
      ),
      fontFamily: FontFamily.assistant.assetName,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: _singleColor(Colors.transparent),
          foregroundColor: hovered,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary),
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          for (TargetPlatform platform in TargetPlatform.values) platform: _PageTransitionBuilder(),
        },
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          fontFamily: FontFamily.assistant.assetName,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  SnackBarThemeData _snackBar({
    required ColorScheme colorScheme,
  }) {
    return SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.lerp(
        colorScheme.surface,
        Colors.black,
        0.5,
      ),
      width: 400,
      insetPadding: EdgeInsets.all(24),
      contentTextStyle: TextStyle(
        color: colorScheme.primary,
      ),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }

  WidgetStateProperty<Color> _singleColor(Color color) {
    return WidgetStateProperty.all(color);
  }

  WidgetStateProperty<Color?> _hoveredColor(
    Color color, {
    Color? fallback,
  }) {
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return color;
        }

        return fallback;
      },
    );
  }
}

class _PageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
      child: child,
    );
  }
}
