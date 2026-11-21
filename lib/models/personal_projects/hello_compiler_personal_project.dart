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
        text: "I started with the most basic ",
      ),

      // TODO(genix): struggles with assembly
      // TODO(genix): no optimization
      // TODO(genix): wanting to add variables, but not having time
      // TODO(genix): the project has succeeded in what it was intended to do - give me some light on how the process works, from designing, to implementing, testing and optimizing
    ];
  }
}
