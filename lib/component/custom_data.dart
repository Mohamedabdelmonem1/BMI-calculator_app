import 'package:flutter/material.dart';

class CustomData extends StatelessWidget {
  const CustomData(
      {super.key,
      required this.onPressed1,
      required this.icon1,
      required this.num,
      required this.text,
      required this.onPressed2,
      required this.icon2});

  final void Function() onPressed1;
  final IconData icon1;
  final void Function() onPressed2;
  final IconData icon2;
  final String num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.grey[400]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              num,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: onPressed1,
                  child: Icon(
                    icon1,
                    size: 30,
                  ),
                ),
                FloatingActionButton(
                  mini: true,
                  onPressed: onPressed2,
                  child: Icon(
                    icon2,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
