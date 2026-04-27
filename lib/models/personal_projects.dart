import 'package:portfolio6/models/_models.dart';

final List<Project> personalProjects = [
  Project(
    id: 'rust-morse',
    // TODO(genix): add
    assetImagePath: null,
    name: 'Morse encoder-decoder CLI app in Rust',
    tags: ['rust', 'TUI', 'morse', 'audio'],
    dateText: '5 - 27 Mar 2026',
  ),

  Project(
    id: 'sudoku',
    // TODO(genix): add
    assetImagePath: null,
    name: 'Sudoku mobile app',
    tags: ['flutter', 'mobile'],
    dateText: '10 - 12 Mar 2026',
  ),

  Project(
    id: 'quarantino',
    assetImagePath: 'assets/images/projects/quarantino/quarantino-banner.jpg',
    name: 'Quarantino (covid hackathon project)',
    // TODO(genix): imp
    tags: ['hackathon', 'flutter', 'mobile'],
    dateText: '17 - 22 Mar 2020',
  ),

  Project(
    id: 'pictile',
    assetImagePath: 'assets/images/projects/pictile/pictile-banner.jpg',
    name: 'Pictile',
    // TODO(genix): imp
    tags: [],
    // TODO(genix): add
    dateText: null,
  ),

  Project(
    id: 'placelytics',
    assetImagePath: 'assets/images/projects/placelytics/placelytics-banner.jpg',
    name: 'Placelytics (engineering project)',
    // TODO(genix): imp
    tags: ['flutter', 'mobile'],
    dateText: '8 Oct 2019 - 18 Apr 2020',
  ),

  Project(
    id: 'the-hardest-game',
    assetImagePath: 'assets/images/projects/thg/thg-banner.jpg',
    name: 'The Hardest Game',
    // TODO(genix): imp
    tags: ['flutter', 'mobile'],
    dateText: null,
  ),

  Project(
    id: 'website',
    assetImagePath: 'assets/images/projects/website/website-banner.jpg',
    name: 'The website',
    // TODO(genix): imp
    tags: [],
    dateText: '2020 - Present',
  ),

  Project(
    id: 'language-apps',
    assetImagePath: 'assets/images/projects/myword/myword-banner.jpg',
    name: 'Language learning apps',
    // TODO(genix): imp
    tags: [],
    dateText: '2018 - 2023',
  ),
];
