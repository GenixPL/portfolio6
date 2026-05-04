import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio6/models/_models.dart';

part 'github_contribution_calendar.g.dart';

@JsonSerializable()
class GithubContributionCalendar {
  const GithubContributionCalendar({
    required this.totalContributions,
    required this.weeks,
  });

  // region Json

  factory GithubContributionCalendar.fromJson(Map<String, dynamic> json) {
    return _$GithubContributionCalendarFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GithubContributionCalendarToJson(this);
  }

  // endregion

  @JsonKey(name: 'totalContributions')
  final int totalContributions;

  @JsonKey(name: 'weeks')
  final List<GithubContributionWeek> weeks;

  GithubContributionDay? dayForIndex(int i) {
    final GithubContributionDay firstDay = this.firstDay;

    final int dayOffset = firstDay.weekday;
    if (i < dayOffset) {
      return null;
    }

    final GithubContributionWeek week = weeks[i ~/ 7];

    final int dayI = i % 7;
    return week.contributionDays.firstWhereOrNull((day) => day.weekday == dayI);
  }

  GithubContributionDay get firstDay {
    return weeks.first.contributionDays.first;
  }

  GithubContributionDay get lastDay {
    return weeks.last.contributionDays.last;
  }
}
