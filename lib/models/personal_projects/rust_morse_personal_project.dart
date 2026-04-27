import 'package:portfolio6/models/_models.dart';

class RustMorsePersonalProject extends PersonalProject {
  RustMorsePersonalProject()
    : super(
        id: 'rust-morse',
        // TODO(genix): add
        assetImagePath: null,
        name: 'Morse encoder-decoder CLI app in Rust',
        tags: ['rust', 'TUI', 'morse', 'audio'],
        dateText: '5 - 27 Mar 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
