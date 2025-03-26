import 'package:intl/intl.dart';

class TimeUtil {
  static String formatDate(DateTime date) {
    return DateFormat('HH:mm a').format(date);
  }
}
