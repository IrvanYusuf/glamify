// TODO Implement this library.

import 'package:intl/intl.dart';

String customMoneyFormatter(num amount) {
  String currency =
      NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2)
          .format(amount);

  return currency;
}
