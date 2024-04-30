import 'package:flutter/material.dart';
import 'dart:math';

import 'package:glamify/utils/custom_money_formatter.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _selectedShipping = "Standar";
  double _selectedPriceShipping = 25000;
  String? _selectedPayment = "Tunai";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Pembayaran",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _pengiriman(),
                  const SizedBox(
                    height: 16,
                  ),
                  _cartProductBuyContainer(context),
                  const SizedBox(
                    height: 16,
                  ),
                  _containerRadioButtonShipping(),
                  const SizedBox(
                    height: 16,
                  ),
                  _containerRadioButtonPayment(),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(164, 240, 240, 240),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rincian Pesanan"),
                          _orderDetailsItems("Total Harga", "3000000"),
                          _orderDetailsItems(
                              "Jenis Pembayaran", _selectedPayment),
                          _orderDetailsItems(
                              "Jenis Pengiriman", _selectedShipping),
                          _orderDetailsItems(
                            "Biaya Pengiriman",
                            _selectedPriceShipping.toString(),
                          ),
                          _orderDetailsItems("Total Pembayaran", "3025000"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buttonCreateOrder(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderDetailsItems(String? name, String? value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (name != null) // Conditionally display name
            Text(
              name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: "Segoe"),
            ),
          Text(
            (name == "Jenis Pengiriman" || name == "Jenis Pembayaran")
                ? value ?? ""
                : customMoneyFormatter(
                    double.parse(value ?? "0"),
                  ),
            style: TextStyle(
                fontSize: (name == "Total Pembayaran") ? 16 : 14,
                fontWeight: FontWeight.bold,
                fontFamily: "Segoe",
                color: (name == "Total Pembayaran")
                    ? Color(0xff333A73)
                    : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buttonCreateOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/order-confirmation");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff333A73),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Buat Pesanan",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Segoe"),
        ),
      ),
    );
  }

  Widget _containerRadioButtonShipping() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(164, 240, 240, 240),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Pengiriman",
              style: TextStyle(
                fontFamily: "Segoe",
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            _radioButtonShipping("Standar", "12 - 15 April", "Standar", 25000),
            _radioButtonShipping("Medium", "07 - 10 April", "Medium", 30000),
            _radioButtonShipping("Express", "1 hari", "Express", 38000),
          ],
        ),
      ),
    );
  }

  Widget _containerRadioButtonPayment() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(164, 240, 240, 240),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Pembayaran",
              style: TextStyle(
                fontFamily: "Segoe",
              ),
            ),
            _radioButtonPayment("assets/icon/bca.png", "Bank BCA", "BCA"),
            _radioButtonPayment("assets/icon/bri.png", "Bank BRI", "BRI"),
            _radioButtonPayment(
                "assets/icon/mandiri.png", "Bank Mandiri", "Mandiri"),
            _radioButtonPayment("assets/icon/cash.png", "Tunai", "Tunai"),
          ],
        ),
      ),
    );
  }

  Widget _cartProductBuyContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(164, 240, 240, 240),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Produk yang dibeli"),
            const SizedBox(
              height: 8,
            ),
            _cartProductBuy(context),
            _cartProductBuy(context),
            _cartProductBuy(context),
          ],
        ),
      ),
    );
  }

  Widget _cartProductBuy(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
      child: Card(
        color: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image/nike.png",
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sepatu Nike",
                  style: TextStyle(
                      fontFamily: "Segoe", fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1 x Rp1.000.000",
                  style: TextStyle(
                      fontFamily: "Segoe", fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pengiriman() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(164, 240, 240, 240),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Alamat Pengiriman Kamu",
              style: TextStyle(
                fontFamily: "Segoe",
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icon/location.png"),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "Rumah - Irvan Yusuf Cahyadi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Segoe",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Jl.Thamrin,Gg.Thamrin,Thamrin,kec.Thamrin...",
                      style: TextStyle(
                        fontFamily: "Segoe",
                      ),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: 180 * pi / 180,
                  child: Image.asset(
                    "assets/icon/arrow-left.png",
                    width: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioButtonShipping(String nameShipping, String estimateArrived,
      String value, double priceShipping) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff323031),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameShipping,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Segoe",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/icon/shipping.png",
                    width: 30,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("Estimasi ${estimateArrived}"),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                customMoneyFormatter(priceShipping),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Segoe",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Radio(
                value: value,
                groupValue: _selectedShipping,
                onChanged: (newValue) {
                  // Tambahkan tipe data String?
                  setState(() {
                    _selectedShipping = newValue;
                    _selectedPriceShipping = priceShipping;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radioButtonPayment(
      String imagePayment, String namePayment, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff323031),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePayment,
                width: 40,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                namePayment,
                style: TextStyle(
                  fontFamily: "Segoe",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: value,
                groupValue: _selectedPayment,
                onChanged: (newValue) {
                  // Tambahkan tipe data String?
                  setState(
                    () {
                      _selectedPayment = newValue;
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
