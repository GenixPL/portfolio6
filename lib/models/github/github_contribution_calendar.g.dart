// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_contribution_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubContributionCalendar _$GithubContributionCalendarFromJson(
  Map<String, dynamic> json,
) => GithubContributionCalendar(
  totalContributions: (json['totalContributions'] as num).toInt(),
  weeks: (json['weeks'] as List<dynamic>)
      .map((e) => GithubContributionWeek.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GithubContributionCalendarToJson(
  GithubContributionCalendar instance,
) => <String, dynamic>{
  'totalContributions': instance.totalContributions,
  'weeks': instance.weeks,
};
