const List<MediumFeedItem> mediumFeedItems = [
  MediumFeedItem(
    title: 'Missing fun of speedrunning personal projects',
    description: 'Coding without thinking (much)',
    publicationDateString: '2026-03-19',
    mediaUrl: 'https://cdn-images-1.medium.com/max/496/1*L2PD6oH28myhZQLWz7c2WQ.gif',
    url: 'https://medium.com/@GenixPL/missing-fun-of-speedrunning-personal-projects-ad85b08706cd',
    tags: [
      'mobile-app-development',
      'flutter',
      'careers',
      'programming',
      'mobile',
    ],
  ),

  MediumFeedItem(
    title: '(A Way Of) Managing (Flutter) Dependencies',
    description: 'A way of handling dependencies in large-scale Flutter projects.',
    publicationDateString: '2025-12-30',
    mediaUrl: 'https://cdn-images-1.medium.com/max/1024/1*SW_WKMu6L40rf58uUTYCKA.png',
    url: 'https://medium.com/@GenixPL/a-way-of-managing-flutter-dependencies-d9540d4221ed',
    tags: [
      'flutter',
      'dart',
      'programming',
      'mobile-app-development',
      'software-architecture',
    ],
  ),

  MediumFeedItem(
    title: 'Beginner’s guide to Go notifications service with Firebase Messaging v1 (OAuth 2)',
    description: null,
    publicationDateString: '2024-12-15',
    mediaUrl: 'https://cdn-images-1.medium.com/max/1024/1*6nP1fRgjATjSneDipdNLdQ.png',
    url:
        'https://medium.com/@GenixPL/beginners-guide-to-go-notifications-service-with-firebase-messaging-v1-oauth-2-18da115f3618',
    tags: [
      'coding',
      'golang',
      'programming',
      'google-cloud-platform',
      'firebase',
    ],
  ),

  MediumFeedItem(
    title: 'Why TDD isn’t always the best option',
    description: null,
    publicationDateString: '2024-11-22',
    mediaUrl: 'https://cdn-images-1.medium.com/max/496/1*7ix5V_0nPQHkvki2_imE7A.png',
    url: 'https://medium.com/@GenixPL/why-tdd-isnt-always-the-best-option-0aba2e5ec705',
    tags: [
      'software-development',
      'programming',
      'clean-code',
      'testing',
      'software-engineering',
    ],
  ),

  MediumFeedItem(
    title: 'GoRouter; best practices',
    description: null,
    publicationDateString: '2024-10-20',
    mediaUrl: 'https://cdn-images-1.medium.com/max/1024/1*z4p-dX4zgXS_q7pWJI4QKw.png',
    url: 'https://medium.com/@GenixPL/gorouter-best-practices-062790b5cfc9',
    tags: ['navigation', 'dart', 'flutter', 'clean-code', 'programming'],
  ),

  MediumFeedItem(
    title: 'GoRouter; route deprecation',
    description: 'Preserving deep linking while changing UX',
    publicationDateString: '2024-10-20',
    mediaUrl: 'https://cdn-images-1.medium.com/max/1024/1*pRFSHLczpHutCwos9prO9A.png',
    url: 'https://medium.com/@GenixPL/gorouter-route-deprecation-cd93cc4ee5f9',
    tags: ['clean-code', 'navigation', 'programming', 'flutter', 'dart'],
  ),

  MediumFeedItem(
    title: 'Why you should stop using GetIt',
    description: null,
    publicationDateString: '2024-08-23',
    mediaUrl: 'https://cdn-images-1.medium.com/max/700/1*pN5Dqw2iC7nrjFB2SyxKiQ.png',
    url: 'https://medium.com/@GenixPL/why-you-should-stop-using-getit-fa08b7f0699d',
    tags: [
      'service-locator',
      'clean-code',
      'flutter',
      'dart-programming-language',
      'programming',
    ],
  ),

  MediumFeedItem(
    title: 'How to get rid of circular dependencies',
    description: 'There comes a time, in life of a programmer, when one has to get rid of a circular dependency.',
    publicationDateString: '2024-08-23',
    mediaUrl: 'https://cdn-images-1.medium.com/max/397/1*Lji9mRHiFfDoEKe8DJFZIw.gif',
    url: 'https://medium.com/@GenixPL/how-to-get-rid-of-circular-dependencies-9c17303c169a',
    tags: ['programming', 'programming-tips', 'dependencies', 'clean-code'],
  ),
];

class MediumFeedItem {
  const MediumFeedItem({
    required this.title,
    required this.description,
    required this.publicationDateString,
    required this.mediaUrl,
    required this.url,
    required this.tags,
  });

  final String title;
  final String publicationDateString;
  final String? description;
  final String mediaUrl;
  final String url;
  final List<String> tags;

  DateTime get publicationDate {
    return DateTime.parse(publicationDateString);
  }
}
