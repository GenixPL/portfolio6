// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_contribution_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubContributionWeek _$GithubContributionWeekFromJson(
  Map<String, dynamic> json,
) => GithubContributionWeek(
  contributionDays: (json['contributionDays'] as List<dynamic>)
      .map((e) => GithubContributionDay.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GithubContributionWeekToJson(
  GithubContributionWeek instance,
) => <String, dynamic>{'contributionDays': instance.contributionDays};
