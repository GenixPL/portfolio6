import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.item,
  });

  final MediumFeedItem item;

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 16;

    final String? url = item.url;
    final DateTime? date = item.publicationDate;

    const double cornerCut = 24;

    return Center(
      child: GenGestureDetector.base(
        onTap: () {
          if (url != null) {
            launchUrlString(url);
          }
        },
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 480,
          ),
          decoration: ShapeDecoration(
            color: Color(0xff_09_09_09),
            shadows: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6,
              )
            ],
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerCut),
                bottomRight: Radius.circular(cornerCut),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                // TODO(genix): change title font
                child: Text(
                  item.title ?? 'no title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.cpMono.assetName,
                  ),
                ),
              ),

              SizedBox(
                height: 240,
                child: Image.network(
                  item.mediaUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: verticalPadding,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (String tag in item.tags)
                          Chip(
                            mouseCursor: SystemMouseCursors.click,
                            label: Text(
                              tag,
                              style: TextStyle(
                                height: 1.0,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                applyHeightToLastDescent: false,
                              ),
                            ),
                          ),
                      ],
                    ),

                    Row(
                      children: [
                        if (date != null)
                          Text(
                            '${date.day}'
                            ' ${DateFormat.MMM().format(DateTime(0, date.month))}'
                            '${date.year == DateTime.now().year ? "" : " ${date.year}"}',
                          ),

                        Spacer(),
                        if (url != null)
                          TextButton(
                            onPressed: () => launchUrlString(url),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  // Space at the end add "padding" to the icon.
                                  'READ MORE ',
                                  style: TextStyle(
                                    fontFamily: FontFamily.cpMono.assetName,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                    applyHeightToLastDescent: false,
                                  ),
                                ),
                                Icon(Icons.open_in_new_sharp),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
