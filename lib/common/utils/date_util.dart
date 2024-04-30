import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat(DateFormat.HOUR24_MINUTE).format(date);
  }
}