import 'package:portfolio6/models/_models.dart';

class SudokuPersonalProject extends PersonalProject {
  SudokuPersonalProject()
    : super(
        id: 'sudoku',
        // TODO(genix): add
        assetImagePath: null,
        name: 'Sudoku mobile app',
        tags: ['flutter', 'mobile'],
        dateText: '10 - 12 Mar 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
