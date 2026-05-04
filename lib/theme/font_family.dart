enum FontFamily {
  cpMono,
  kontanter,
  inter,
  ;

  String get assetName {
    return switch (this) {
      cpMono => 'CPMono',
      kontanter => 'Kontanter',
      inter => 'Inter',
    };
  }
}
