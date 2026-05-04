import 'dart:convert';

import 'package:http/http.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/utils/_utils.dart';

// The token is a minimal, read-only, token from a secondary empty account,
// nothing to steal.
const String _token =
    'V2pKc01HRklWbWxZTTBKb1pFWTRlRTFWVGtWU1ZUUjVWMFpyZDFGVlNqTldTRlkwVGtkR1VXRnVaRXBZTWpWVVUwaGtTMlZYUmpaV2EyaFVXbnBHY0ZSSVVtNWpNMmh4VGxoQ1lXSnRTalZWV0dSUVpESnNUbFJJV2pOTmEwcFBaVlZqTUdFeU5ERlRla2t5VVZaa1UxWlZUWGRTUlc4d1lsaFNVQT09';
const String url = 'https://api.github.com/graphql';
const String userName = 'GenixPL';

final AsyncMutex _mutex = AsyncMutex();
final Map<int?, GithubContributionCalendar> _cache = {};

Future<GithubContributionCalendar?> fetchCommitHistory({
  required int? year,
}) {
  return _mutex.run(() async {
    if (_cache[year] != null) {
      return _cache[year];
    }

    final String fromTo;
    if (year != null) {
      fromTo =
          '''
      (
          from: "$year-01-01T00:00:00Z", 
          to: "$year-12-31T23:59:59Z"
        )
    ''';
    } else {
      fromTo = '';
    }

    // The GraphQL query string
    final query =
        '''
    query(\$userName: String!) {
      user(login: \$userName) {
        contributionsCollection$fromTo {
          contributionCalendar {
            totalContributions
            weeks {
              contributionDays {
                contributionCount
                weekday
                date
              }
            }
          }
        }
      }
    }
  ''';

    final String decodedToken1 = utf8.decode(base64.decode(_token));
    final String decodedToken2 = utf8.decode(base64.decode(decodedToken1));
    final String decodedToken3 = utf8.decode(base64.decode(decodedToken2));

    final response = await post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $decodedToken3',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'query': query,
        'variables': {
          'userName': userName,
        },
      }),
    );

    if (response.statusCode != 200) {
      return null;
    }

    final GithubContributionCalendar calendar;
    try {
      final data = jsonDecode(response.body);

      calendar = GithubContributionCalendar.fromJson(
        data['data']['user']['contributionsCollection']['contributionCalendar'],
      );
    } catch (_) {
      return null;
    }

    _cache[year] = calendar;
    return calendar;
  });
}
