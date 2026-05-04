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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            },
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
}
