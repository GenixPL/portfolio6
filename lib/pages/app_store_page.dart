import 'package:material_ui/material_ui.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class AppStorePage extends StatelessWidget {
  const AppStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      pageId: 'hackathons',
      slivers: [
        ...[
          Text('a').sliver,
        ].withGaps(context.theme.cardSpacing),
      ],
    );
  }
}
