// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_contribution_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubContributionDay _$GithubContributionDayFromJson(
  Map<String, dynamic> json,
) => GithubContributionDay(
  contributionCount: (json['contributionCount'] as num).toInt(),
  weekday: (json['weekday'] as num).toInt(),
  date: json['date'] as String,
);

Map<String, dynamic> _$GithubContributionDayToJson(
  GithubContributionDay instance,
) => <String, dynamic>{
  'contributionCount': instance.contributionCount,
  'weekday': instance.weekday,
  'date': instance.date,
};
