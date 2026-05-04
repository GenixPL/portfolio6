import 'package:json_annotation/json_annotation.dart';

part 'github_contribution_day.g.dart';

@JsonSerializable()
class GithubContributionDay {
  const GithubContributionDay({
    required this.contributionCount,
    required this.weekday,
    required this.date,
  });

  // region Json

  factory GithubContributionDay.fromJson(Map<String, dynamic> json) {
    return _$GithubContributionDayFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GithubContributionDayToJson(this);
  }

  // endregion

  @JsonKey(name: 'contributionCount')
  final int contributionCount;

  @JsonKey(name: 'weekday')
  final int weekday;

  @JsonKey(name: 'date')
  final String date;
}
