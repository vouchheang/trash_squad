import 'package:intl/intl.dart';

class DateUtil {
  DateUtil(DateTime date);

  static String formatDate(DateTime date) {
    return DateFormat('MMM dd yyyy').format(date);
  }
}