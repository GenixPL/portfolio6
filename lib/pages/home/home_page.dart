import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/app.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/pages/home/home_page_card.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

// TODO(genix): add proper lints and improve perf with consts and such
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      pageId: 'home',
      slivers: [
        _buildAbout().sliver,

        GithubContributionWidget().sliver,

        _Section(
          title: 'latest articles',
          onTap: () => context.goNamed('articles'),
          children: [
            for (MediumFeedItem item in mediumFeedItems.sublist(0, 5))
              HomePageCard(
                title: item.title,
                subtitle: item.description,
                image: Image.network(
                  item.mediaUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) {
                      return child;
                    }

                    return Center(
                      child: GenProgressIndicator(),
                    );
                  },
                ),
                tags: item.tags,
                dateText: item.publicationDate.articleFormat,
                external: true,
                onTap: () => launchUrlString(item.url),
              ),
          ],
        ).sliver,

        _Section(
          title: 'latest projects',
          onTap: () => context.goNamed('projects'),
          children: [
            for (PersonalProject project in personalProjects.sublist(0, 4))
              HomePageCard(
                title: project.name,
                subtitle: null,
                image: project.assetImagePath == null
                    ? NoImage()
                    : Image.asset(
                        project.assetImagePath!,
                        fit: BoxFit.cover,
                      ),
                tags: project.tags,
                dateText: project.dateText,
                external: false,
                onTap: () => ArticleRoute.go(context, project.id),
              ),
          ],
        ).sliver,

        _Section(
          title: 'work',
          onTap: () => context.goNamed('work'),
          children: [
            for (WorkArticle work in workArticles)
              HomePageCard(
                title: work.name,
                subtitle: work.descriptionText,
                image: Image.asset(
                  work.assetImagePath,
                  fit: BoxFit.cover,
                ),
                tags: work.tags,
                dateText: work.dateText,
                external: false,
                onTap: () => ArticleRoute.go(context, work.id),
              ),
          ],
        ).sliver,

        _Section(
          title: 'hackathons',
          onTap: () => context.goNamed('hackathons'),
          children: [
            for (Hackathon hackathon in hackathons)
              HomePageCard(
                title: hackathon.name,
                subtitle: hackathon.description,
                image: Image.asset(
                  hackathon.assetImagePath,
                  fit: BoxFit.cover,
                ),
                tags: [],
                dateText: hackathon.dateText,
                external: false,
                onTap: () => ArticleRoute.go(context, hackathon.id),
              ),
          ],
        ).sliver,
      ].withGaps(context.theme.defaultSpacing(context)),
    );
  }

  Widget _buildAbout() {
    final TextStyle headStyle = context.theme.textTheme.headlineSmall!;
    final TextStyle contrastHeadStyle = headStyle.copyWith(
      color: context.theme.secondary,
    );
    final TextStyle titleStyle = context.theme.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w500,
    );

    final int programmingForMonths =
        // 2016
        4 +
        // months since 2016
        (DateTime.now().year - 2016) * 12 +
        DateTime.now().month;

    final int commercialForYears = DateTime.now().year - 2020;

    return Wrap(
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        Dino(
          onTap: () => context.goNamed('dino'),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width > 860 ? 500 : double.infinity,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text.rich(
                TextSpan(
                  style: headStyle,
                  children: [
                    TextSpan(
                      text: 'Hei!\n',
                      style: contrastHeadStyle,
                    ),
                    TextSpan(
                      text: "I'm ",
                      style: headStyle,
                    ),
                    TextSpan(
                      text: "łuKASZ NieDZiAłeK\n",
                      style: headStyle.copyWith(
                        fontFamily: FontFamily.kontanter.assetName,
                      ),
                    ),
                    TextSpan(
                      style: titleStyle,
                      children: [
                        TextSpan(
                          text: "I have ",
                        ),
                        TextSpan(
                          text: (programmingForMonths ~/ 12).toString(),
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text: ' years (and ',
                        ),
                        TextSpan(
                          text: (programmingForMonths % 12).toString(),
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text: ' months) of programming experience, including ',
                        ),
                        TextSpan(
                          text: '$commercialForYears+',
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text:
                              " years of commercial work. I'm strongly focused on mobile development, with specializations in ",
                        ),
                        TextSpan(
                          text: 'Flutter',
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Android',
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text: ", but I've touched countless other technologies. I'm located somewhere between ",
                        ),
                        TextSpan(
                          text: 'Warsaw',
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Oslo',
                          style: contrastHeadStyle,
                        ),
                        TextSpan(
                          text:
                              ". Outside of programming I am deep into investing and devoting my free time to long hikes, books, beer, cigars, and German rap.",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReadMore(
                    text: 'contact',
                    onTap: () => context.goNamed('contact'),
                    external: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.onTap,
    required this.children,
  });

  final String title;
  final VoidCallback onTap;
  final List<HomePageCard> children;

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 12;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: horizontalPadding),
                    Text(
                      title.toUpperCase(),
                      style: context.theme.textTheme.headlineSmall!.copyWith(
                        height: 1,
                      ),
                      textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: horizontalPadding),
                    ReadMore(
                      text: 'see all',
                      onTap: onTap,
                      external: false,
                    ),
                    SizedBox(width: horizontalPadding),
                  ],
                ),
              ],
            ),
            Gap(12),
            Center(
              child: Carousel(
                maxHeight: 400,
                aspectRatio: null,
                children: [
                  for (HomePageCard child in children)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: child,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
