import 'package:flutter/material.dart';

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

  double get minPagePadding {
    return 32.0;
  }
}

class GenTheme {
  const GenTheme();

  ThemeData build() {
    final ColorScheme colorScheme = .dark(
      primary: Colors.white,
      secondary: Colors.amberAccent,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: _singleColor(Colors.transparent),
          foregroundColor: _hoveredColor(colorScheme.secondary.withAlpha(200)),
        ),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          for (TargetPlatform platform in TargetPlatform.values) platform: _PageTransitionBuilder(),
        },
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
