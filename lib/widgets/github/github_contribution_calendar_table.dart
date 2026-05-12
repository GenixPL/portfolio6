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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  static const double _tileSpacing = 2;
  static const double _spacing = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            spacing: _spacing,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDay(''),
                  _buildDay('Mon'),
                  _buildDay(''),
                  _buildDay('Wed'),
                  _buildDay(''),
                  _buildDay('Fri'),
                  _buildDay(''),
                ],
              ),
              Flexible(
                child: GridView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: _tileSpacing,
                    crossAxisSpacing: _tileSpacing,
                  ),
                  itemCount: widget.calendar.weeks.length * 7,
                  itemBuilder: (context, int i) {
                    final GithubContributionDay? day = widget.calendar.dayForIndex(i);
                    if (day == null) {
                      return const SizedBox();
                    }

                    return GithubContributionCalendarTableTile(
                      value: day.contributionCount,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: widget.size / 8,
          child: Row(
            children: [
              _buildDay('   '),

              const Gap(_spacing),
              ..._buildLegend(null, 0),

              const Gap(_spacing * 2),
              ..._buildLegend(1, 4),

              const Gap(_spacing * 2),
              ..._buildLegend(5, 9),

              const Gap(_spacing * 2),
              ..._buildLegend(10, 14),

              const Gap(_spacing * 2),
              ..._buildLegend(15, 19),

              const Gap(_spacing * 2),
              ..._buildLegend(20, null),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildLegend(int? low, int? high) {
    return [
      SizedBox.square(
        dimension: widget.size / 8,
        child: Padding(
          padding: const EdgeInsets.only(
            top: _tileSpacing,
            right: _tileSpacing,
          ),
          child: GithubContributionCalendarTableTile(
            value: low ?? 0,
          ),
        ),
      ),
      const Gap(2),
      Text(
        switch ((low, high)) {
          (null, null) => 'error',
          (null, int h) => '$h',
          (int l, int h) => '$l-$h',
          (int l, null) => '$l+',
        },
        style: TextStyle(
          fontSize: widget.size / 8 - _tileSpacing,
          fontFamily: FontFamily.cpMono.assetName,
        ),
      ),
    ];
  }

  Widget _buildDay(String text) {
    final double height = widget.size / 8;

    return SizedBox(
      height: height,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: FontFamily.cpMono.assetName,
            fontSize: (height) * 0.8,
          ),
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToLastDescent: false,
            applyHeightToFirstAscent: false,
          ),
        ),
      ),
    );
  }
}
