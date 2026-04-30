import 'package:portfolio6/models/_models.dart';

class SudokuPersonalProject extends PersonalProject {
  SudokuPersonalProject()
    : super(
        id: 'sudoku',
        assetImagePath: 'assets/images/projects/sudoku/sudoku-banner.png',
        name: 'Sudoku mobile app',
        tags: ['flutter', 'mobile'],
        dateText: '10 - 12 Mar 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath!,
      ),
      Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      Space.big(),
      MediumLink(
        url: 'https://medium.com/@GenixPL/missing-fun-of-speedrunning-personal-projects-ad85b08706cd',
      ),

      Space.medium(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/ct4PwCOy9D8',
      ),
    ];
  }
}
