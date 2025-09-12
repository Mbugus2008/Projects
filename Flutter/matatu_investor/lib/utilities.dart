import 'package:intl/intl.dart';

class utilities {
  static DateFormat formatter = DateFormat('dd-MMM-yyyy');
  static final DateFormat loandateformatter = DateFormat('MMM-yyyy');
  static NumberFormat formatcurrency =
      NumberFormat.currency(locale: "en_KE", symbol: "");

  static final NumberFormat formatno = NumberFormat("#", "en_KE");

  static double vehicletiles_width = 50;
}
