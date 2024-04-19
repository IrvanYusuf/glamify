// TODO Implement this library.

import 'package:intl/intl.dart';

String customMoneyFormatter(double amount) {
  String currency =
      NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 2)
          .format(amount);

  return currency;
}
