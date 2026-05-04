import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

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
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // GH link
            // Contributions summary
            // spacer
            // year picker
            Spacer(),
            _buildYearSelector(),
          ],
        ),
        SizedBox(
          height: 200,
          child: _buildBody(),
        ),
      ],
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
        _fetch();
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

  Widget _buildBody() {
    if (_loading) {
      return Center(
        child: GenProgressIndicator(),
      );
    }

    if (_calendar == null) {
      // TODO(genix): imp
      return Center(
        child: Text(
          'ERROR',
          style: TextStyle(
            fontFamily: FontFamily.cpMono.assetName,
            color: context.theme.colorScheme.error,
          ),
        ),
      );
    }

    return GithubContributionCalendarTable(
      githubContributionCalendar: _calendar!,
    );
  }

  Future<void> _fetch() async {
    _loading = true;
    _calendar = await fetchCommitHistory(
      year: _year,
    );
    _loading = false;
    setState(() {});
  }
}
