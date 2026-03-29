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
}

class GenTheme {
  const GenTheme();

  ThemeData build() {
    final ColorScheme colorScheme = .dark(
      primary: Colors.white,
      secondary: Colors.amberAccent,
    );

    return ThemeData(
      colorScheme: colorScheme,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: _singleColor(Colors.transparent),
          foregroundColor: _hoveredColor(colorScheme.secondary.withAlpha(200)),
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
