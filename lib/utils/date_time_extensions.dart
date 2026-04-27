import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get articleFormat {
    return '$day'
        ' ${DateFormat.MMM().format(DateTime(0, month))}'
        '${year == DateTime.now().year ? "" : " $year"}';
  }
}
