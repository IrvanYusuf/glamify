import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String message;
  final String time;
  const CardNotification(
      {super.key,
      required this.icon,
      required this.color,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        fontFamily: "Segoe",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontFamily: "Segoe",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
