import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/personal_projects/personal_project.dart';

// TODO(genix): dupa article?
class HelloCompilerPersonalProject extends PersonalProject {
  const HelloCompilerPersonalProject()
    : super(
        id: 'hello-compiler',
        assetImagePath: 'assets/images/projects/hello-compiler/hello-compiler-banner.png',
        name: 'Hello Compiler',
        tags: const [
          'Assembly',
          'Dart',
          'Compiler',
          'ARM64',
          'Syntax Tree',
          'Antigravity',
          'Claude',
        ],
        dateText: '23 Sep - 8 Oct 2026',
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

      const Space.medium(),
      const GithubLink(
        url: 'https://github.com/GenixPL/hello_compiler',
      ),

      const Space.medium(),
      Tags(
        tags: tags,
      ),

      const Space.medium(),
      const Body(
        text:
            "In search of things to learn, I decided that it's time to cross this "
            "rite of passage and write a compiler.",
      ),

      const Space.small(),
      const Body(
        text:
            "I really like data structures and design patterns, so I've decided "
            "to skip all tutorials and guides, and invent the whole from scratch. "
            "I had a vague idea that we are simply trying to translate one thing "
            "onto another, and that trees are usually involved.",
      ),

      const Space.small(),
      const Body(
        text:
            "For some reason it seemed like a nice idea (it was not) to compile "
            "the source to assembly, which I had touched only during my uni "
            "years, and to invent my own micro-language for the source.",
      ),

      const Space.medium(),
      const Body(
        text:
            "I started with the most basic compilation of a print. Then added to int to "
            "string conversion. Then chaining methods so I could convert int to string and "
            "then print it. And stopped on int addition. So int + int → + int → string → print, "
            "is a working path.",
      ),

      const Space.small(),
      const Body(
        text:
            "As previously mentioned, choosing Assembly as the target was not the best idea. "
            "Most of my struggles were caused by having to deal with it instead of actual "
            "compiler problems, but I was stubborn enough to keep going.",
      ),

      const Space.small(),
      const Body(
        text: "My intention was to include variables as well. But other things have taken priority.",
      ),

      const Space.small(),
      const Body(
        text:
            "I've left it as it was - heavily unoptimized, but I'm still happy with the results. "
            "I've figured out the general idea behind the process, and spent some nice time writing"
            "the tree, the rest is just more time for more polish.",
      ),

      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1,
        imgPaths: [
          for (int i = 1; i <= 7; i++) 'assets/images/projects/hello-compiler/$i.png',
        ],
      ),
    ];
  }
}
