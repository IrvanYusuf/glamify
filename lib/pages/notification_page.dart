import 'package:flutter/material.dart';
import 'package:glamify/components/card_notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Notifikasi",
          style: TextStyle(
            fontFamily: "Segoe",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xff323031),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(
            height: 16,
          ),
          CardNotification(
            color: const Color(0xffffd600)!,
            icon: Icons.star_rounded,
            message: "Beri Rating Untuk Produk Yang Baru Anda Beli",
            time: "8 hari yang lalu",
          ),
          CardNotification(
            color: const Color(0xfff56564)!,
            icon: Icons.padding_rounded,
            message: "Paket Telah Diterima",
            time: "8 hari yang lalu",
          ),
          CardNotification(
            color: const Color(0xff4f50e9)!,
            icon: Icons.local_shipping_rounded,
            message: "Paket Sedang Dalam Perjalanan",
            time: "10 hari yang lalu",
          ),
          CardNotification(
            color: Colors.greenAccent[700]!,
            icon: Icons.check,
            message: "Berhasil Melakukan Pemesanan",
            time: "11 hari yang lalu",
          ),
        ],
      )),
    );
  }
}
