import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

// TODO(genix): widget where the wrap has the last line from the right

class GithubContributionWidget extends StatefulWidget {
  const GithubContributionWidget({super.key});

  @override
  State<GithubContributionWidget> createState() => _GithubContributionWidgetState();
}

class _GithubContributionWidgetState extends State<GithubContributionWidget> {
  GithubContributionCalendar? _calendar;
  int? _year;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    unawaited(
      _fetch(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double size = 84;

    return RepaintBoundary(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 84 / 7 * 53 + 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 2,
            children: [
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Logo(
                          size: 30,
                          onTap: () => launchUrlString('https://github.com/GenixPL'),
                          child: Image.asset(
                            'assets/images/logos/github_logo.png',
                          ),
                        ),
                        if (_calendar != null)
                          Flexible(
                            child: Text(
                              '${_calendar!.totalContributions} contributions in ${_year ?? 'Trailing Twelve Months'}',
                              style: context.theme.textTheme.bodyMedium,
                            ),
                          ),
                      ],
                    ),
                  ),
                  _buildYearSelector(),
                ],
              ),
              SizedBox(
                height: size,
                child: _buildBody(
                  size: size,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYearSelector() {
    final TextStyle textStyle = TextStyle(
      fontFamily: FontFamily.cpMono.assetName,
    );

    return DropdownButton(
      value: _year,
      onChanged: (item) {
        _year = item;
        unawaited(
          _fetch(),
        );
        setState(() {});
      },
      items: [
        DropdownMenuItem<int?>(
          value: null,
          child: Text(
            ' TTM',
            style: textStyle,
          ),
        ),
        for (int i = DateTime.now().year; i >= 2016; i--)
          DropdownMenuItem<int?>(
            value: i,
            child: Text(
              ' $i',
              style: textStyle,
            ),
          ),
      ],
    );
  }

  Widget _buildBody({
    required double size,
  }) {
    if (_loading) {
      return const Center(
        child: GenProgressIndicator(),
      );
    }

    if (_calendar == null) {
      return Center(
        child: Text(
          'SOMETHING WENT WRONG',
          style: TextStyle(
            fontFamily: FontFamily.cpMono.assetName,
            color: context.theme.colorScheme.error,
          ),
        ),
      );
    }

    return GithubContributionCalendarTable(
      year: _year,
      size: size,
      calendar: _calendar!,
    );
  }

  Future<void> _fetch() async {
    _loading = true;
    _calendar = null;
    _calendar = await fetchCommitHistory(
      year: _year,
    );
    _loading = false;
    setState(() {});
  }
}
