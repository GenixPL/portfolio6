import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/font_family.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class GithubContributionCalendarTable extends StatefulWidget {
  const GithubContributionCalendarTable({
    super.key,
    required this.year,
    required this.size,
    required this.calendar,
  });

  final int? year;
  final double size;
  final GithubContributionCalendar calendar;

  @override
  State<GithubContributionCalendarTable> createState() => _GithubContributionCalendarTableState();
}

class _GithubContributionCalendarTableState extends State<GithubContributionCalendarTable> {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 1.0,
  );

  static const double _scrollbarThickness = 8.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('-');
    print(widget.calendar.weeks.first.contributionDays.length);

    return Row(
      spacing: 8,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDay('Sun'),
            _buildDay('Mon'),
            _buildDay('Tue'),
            _buildDay('Wed'),
            _buildDay('Thu'),
            _buildDay('Fri'),
            _buildDay('Sat'),
          ],
        ),
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: widget.calendar.weeks.length * 7,
            itemBuilder: (context, int i) {
              final GithubContributionDay? day = widget.calendar.dayForIndex(i);
              if (day == null) {
                return SizedBox();
              }

              return GithubContributionCalendarTableTile(
                value: day.contributionCount,
              );

              return Container(
                color: Colors.redAccent,
              );
            },
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildDay('Sun'),
            _buildDay('Mon'),
            _buildDay('Tue'),
            _buildDay('Wed'),
            _buildDay('Thu'),
            _buildDay('Fri'),
            _buildDay('Sat'),
          ],
        ),
        const SizedBox(width: 4.0),
        Flexible(
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            thickness: _scrollbarThickness,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: _scrollbarThickness + 4.0,
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Column(
                  children: [
                    for (int i = 0; i < 7; i++)
                      _buildRow(
                        context,
                        widget.calendar.weeks,
                        i,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDay(String text) {
    return SizedBox(
      height: widget.size / 7,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: FontFamily.cpMono.assetName,
            fontSize: widget.size / 14,
          ),
          textHeightBehavior: TextHeightBehavior(
            applyHeightToLastDescent: false,
            applyHeightToFirstAscent: false,
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, List<GithubContributionWeek> weeksRaw, int day) {
    return Row(
      children: <Widget>[
        for (GithubContributionWeek weekRaw in weeksRaw)
          GithubContributionCalendarTableTile(
            value: weekRaw.contributionDays.elementAtOrNull(day)?.contributionCount ?? 0,
          ),
      ],
    );
  }
}
