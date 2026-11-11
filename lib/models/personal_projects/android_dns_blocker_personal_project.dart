import 'package:portfolio6/models/_models.dart';

class AndroidDnsBlockerPersonalProject extends PersonalProject {
  const AndroidDnsBlockerPersonalProject()
    : super(
        id: 'android-dns-blocker',
        assetImagePath: null,
        name: 'Android DNS Blocker',
        tags: const [
          'Android',
          'Kotlin',
          'VPN Service',
          'Claude',
        ],
        dateText: '7-11 Nov 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      Headline(
        text: name,
        center: true,
      ),

      const Space.big(),
      const GithubLink(
        url: 'https://github.com/GenixPL/android_dns_blocker',
      ),

      const Space.medium(),
      const AssetApk(
        path: 'assets/files/android_dns_blocker.apk',
      ),

      const Space.medium(),
      Tags(
        tags: tags,
      ),

      const Space.medium(),
      const Body(
        text:
            'I started writing the project in May 2026. Initially I wanted '
            'to write most of the code by hand in order to learn as much as possible, '
            'but due to not having experience with these things, '
            "responsibilities, and other things, I didn't manage to finish it.",
      ),

      const Space.small(),
      const Body(
        text: 'I ended up vibe-coding it with Claude, which took almost no time.',
      ),

      const Space.medium(),
      const Body(
        text:
            'The reason for creating the app was blocking, or limiting, my access to sites like '
            'youtube or facebook, in order to spend my time on more productive things.',
      ),
      const Space.small(),
      const Body(
        text:
            "All other apps that I've tried seemed intrusive. They were packed with ads, "
            "my data seemed to be leaking faster than money from my accounts, constant pop ups, "
            "unnecessary battery drain, and I always felt like my security was being targeted "
            "(especially with the features utilizing accessibility screen reading and overrides).",
      ),
      const Space.small(),
      const Body(
        text:
            'Having my own solution solves all of these issues while draining'
            ' only 0.2% of battery per day.',
      ),

      const Space.medium(),
      const Body(
        text:
            "Feel free to reuse it. It lets you blacklist domains, whitelist domains "
            "(in case you want to keep certain subdomain), and whitelist apps.",
      ),

      const Space.medium(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/vPV8ubaw7EU',
      ),
    ];
  }
}
