import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../app_theme.dart';

class DetailsGlassContainer extends StatelessWidget {
  final Widget child;

  const DetailsGlassContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 330,
      borderRadius: 20,
      blur: 20,
      padding: const EdgeInsets.all(40),
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.secondryColor.withOpacity(0.1),
            AppTheme.secondryColor.withOpacity(0.05),
          ],
          stops: const [
            0.5,
            1,
          ]),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Colors.white,
        ],
      ),
      child: child,
    );
  }
}
