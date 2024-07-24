import 'package:intl/intl.dart';

class AppFormat {
  static String price(num number){
    return NumberFormat.currency(
      decimalDigits: 3,
      symbol: '\Rp. ',
    ).format(number);
  }
  static String number(num number){
    return NumberFormat.currency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
  }
}