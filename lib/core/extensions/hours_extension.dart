import 'package:intl/intl.dart';

extension HourExtension on DateTime{
  double getHour() {
    return double.parse(DateFormat.j()
          .format(this)
          .replaceAll(RegExp(r'PM'), '')
          .replaceAll(RegExp(r'AM'), '')
          .trimRight());
  }
}