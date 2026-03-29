import 'package:flutter/material.dart';

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
