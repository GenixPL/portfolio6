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
}
