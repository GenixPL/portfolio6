enum FontFamily {
  cpMono,
  kontanter,
  assistant,
  ;

  String get assetName {
    return switch (this) {
      cpMono => 'CPMono',
      kontanter => 'Kontanter',
      assistant => 'Assistant',
    };
  }
}
