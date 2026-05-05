enum FontFamily {
  cpMono,
  kontanter,
  inter,
  assistant,
  ;

  String get assetName {
    return switch (this) {
      cpMono => 'CPMono',
      kontanter => 'Kontanter',
      inter => 'Inter',
      assistant => 'Assistant',
    };
  }
}
