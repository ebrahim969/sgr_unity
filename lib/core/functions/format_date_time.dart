import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final date = DateFormat('d MMM yyyy').format(dateTime);
  return date;
}
