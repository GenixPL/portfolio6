enum FontFamily {
  cpMono,
  kontanter,
  ;

  String get assetName {
    return switch (this) {
      cpMono => 'CPMono',
      kontanter => 'Kontanter',
    };
  }
}
