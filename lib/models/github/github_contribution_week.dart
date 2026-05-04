import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio6/models/_models.dart';

part 'github_contribution_week.g.dart';

@JsonSerializable()
class GithubContributionWeek {
  const GithubContributionWeek({
    required this.contributionDays,
  });

  // region Json

  factory GithubContributionWeek.fromJson(Map<String, dynamic> json) {
    return _$GithubContributionWeekFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GithubContributionWeekToJson(this);
  }

  // endregion

  @JsonKey(name: 'contributionDays')
  final List<GithubContributionDay> contributionDays;
}
