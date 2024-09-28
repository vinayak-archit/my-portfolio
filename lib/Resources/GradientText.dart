import 'package:flutter/material.dart';

import 'ColorConstants.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {super.key, 
    this.style, required LinearGradient gradient,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient = const LinearGradient(colors: [
    LEFT_GRADIENT_COLOR,
    RIGHT_GRADIENT_COLOR,
  ]);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
