import 'package:portfolio6/models/_models.dart';

class SudokuPersonalProject extends PersonalProject {
  const SudokuPersonalProject()
    : super(
        id: 'sudoku',
        assetImagePath: 'assets/images/projects/sudoku/sudoku-banner.png',
        name: 'Sudoku',
        tags: const ['flutter', 'mobile'],
        dateText: '10 - 12 Mar 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath!,
      ),
      const Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      const Space.big(),
      const WebLink(url: 'https://genixpl.github.io/sudoku'),
      const Space.small(),
      const AssetApk(
        path: 'assets/files/sudoku.apk',
      ),

      const Space.medium(),
      const MediumLink(
        url: 'https://medium.com/@GenixPL/missing-fun-of-speedrunning-personal-projects-ad85b08706cd',
      ),

      const Space.medium(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/ct4PwCOy9D8',
      ),
    ];
  }
}
