import 'package:flutter/material.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';

class TitlteText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final TextOverflow? overflow;

  const TitlteText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.weight = FontWeight.bold,
    this.size = 30,
    this.overflow = TextOverflow.fade,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
        color: color == Colors.black ? Colors.black : color,
        fontWeight: weight == FontWeight.bold ? FontWeight.bold : weight,
        fontSize: size == 30 ? height * AppDimensions.height30 : size,
        overflow: overflow == TextOverflow.fade ? TextOverflow.fade : overflow,
      ),
    );
  }
}
