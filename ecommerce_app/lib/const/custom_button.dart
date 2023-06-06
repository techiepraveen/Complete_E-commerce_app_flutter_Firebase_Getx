import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.buttonWidth,
      required this.function,
      this.radius,
      required this.text,
      super.key});
  final String text;
  final BorderRadius? radius;
  final Function function;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => function(),
      child: Material(
        elevation: 5,
        borderRadius: radius ?? BorderRadius.circular(20),
        color: const Color.fromARGB(30, 62, 160, 1),
        child: Container(
          height: size.height / 17,
          width: size.width / buttonWidth,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: size.width / 22,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
