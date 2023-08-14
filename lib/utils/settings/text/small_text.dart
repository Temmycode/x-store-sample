import 'package:flutter/material.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final TextOverflow? overflow;

  const SmallText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    this.size = 15,
    this.overflow = TextOverflow.fade,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
        color: color == Colors.black ? Colors.black : color,
        fontWeight: weight == FontWeight.normal ? FontWeight.normal : weight,
        fontSize: size == 15 ? height * AppDimensions.height20 : size,
        overflow: overflow == TextOverflow.fade ? TextOverflow.fade : overflow,
      ),
    );
  }
}
