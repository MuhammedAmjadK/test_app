import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.padding = const EdgeInsets.all(5),
    this.backgroundColor = const Color(0xFFCFD8DC),
    required this.icon,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        minimumSize: MaterialStateProperty.all(const Size(30, 30)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Icon(
        icon,
        color: const Color(0xff243878),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key, required this.text, this.fontSize = 16})
      : super(key: key);

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class CustomBodyText extends StatelessWidget {
  const CustomBodyText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.grey,
        fontWeight: fontWeight,
      ),
    );
  }
}
