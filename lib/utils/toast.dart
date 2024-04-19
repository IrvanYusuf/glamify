import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

void toast(context) {
  showToast(
    "Berhasil Tambah Ke Keranjang",
    backgroundColor: const Color.fromARGB(255, 104, 207, 107),
    context: context,
    axis: Axis.horizontal,
    alignment: Alignment.center,
    position: StyledToastPosition(align: Alignment.bottomCenter, offset: 80.0),
    // position: StyledToastPosition(align: Alignment.bottomCenter),
  );
}
