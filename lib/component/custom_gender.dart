import 'package:flutter/material.dart';

class CustomGender extends StatelessWidget {
  const CustomGender(
      {super.key,
      required this.onTap,
      required this.color,
      required this.icon,
      required this.text});

  final void Function() onTap;
  final Color? color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
