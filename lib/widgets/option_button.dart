import 'package:flutter/material.dart';


class OptionButton extends StatelessWidget {
  const OptionButton({ Key? key, required this.text, this.onPressed }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text, 
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff243D25),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}