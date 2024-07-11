import 'package:flutter/material.dart';
import 'package:glamify/utils/custom_money_formatter.dart';

class CustomCartCard extends StatefulWidget {
  final String title;
  final String urlImage;
  final dynamic price;
  final int quantity;
  final double totalPrice;
  const CustomCartCard(
      {super.key,
      required this.title,
      required this.urlImage,
      required this.price,
      required this.quantity,
      required this.totalPrice});

  @override
  State<CustomCartCard> createState() => _CustomCartCardState();
}

class _CustomCartCardState extends State<CustomCartCard> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.urlImage),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Segoe",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1e1e1e),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              customMoneyFormatter(widget.price),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Segoe",
                                color: Color(0xff333A73),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text("x"),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(widget.quantity.toString()),
                            Spacer(),
                            Text(
                              customMoneyFormatter(widget.totalPrice),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           if (qty > 0) {
            //             qty -= 1;
            //           }
            //         });
            //       },
            //       child: Container(
            //         width: 26,
            //         height: 26,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: const Color.fromARGB(
            //                 255, 184, 184, 184), // Warna border
            //             width: 1.0, // Lebar border
            //           ),
            //           borderRadius: BorderRadius.circular(50.0),
            //           // image: DecorationImage(
            //           //   image: AssetImage("assets/icon/minus.png"),
            //           // ), // Bentuk border
            //         ),
            //         child: Container(
            //           width: 14,
            //           height: 2,
            //           decoration: const BoxDecoration(color: Colors.grey),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 16,
            //     ),
            //     Text(widget.quantity.toString()),
            //     const SizedBox(
            //       width: 16,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           qty += 1;
            //         });
            //       },
            //       child: Container(
            //         width: 26,
            //         height: 26,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           color: const Color(0xff333A73),
            //           borderRadius: BorderRadius.circular(50.0),
            //           // image: DecorationImage(
            //           //   image: AssetImage("assets/icon/minus.png"),
            //           // ), // Bentuk border
            //         ),
            //         child: const Icon(
            //           Icons.add,
            //           color: Colors.white,
            //           size: 16,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
