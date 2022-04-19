import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({ Key? key, required this.icon, this.onTap}) : super(key: key);

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54
        ),
      ),
    );
  }
}