import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd yyyy').format(date);
  }
}
