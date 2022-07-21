import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../app_theme.dart';

class TileGlassContainer extends StatelessWidget {
  final Widget child;

  const TileGlassContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        height: 130,
        width: MediaQuery.of(context).size.width,
        borderRadius: 20,
        blur: 20,
        padding: const EdgeInsets.all(40),
        alignment: Alignment.bottomCenter,
        border: 2,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.secondryColor.withOpacity(0.2),
              AppTheme.secondryColor.withOpacity(0.05),
            ],
            stops: const [
              1,
              1,
            ]),
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        ),
        child: child);
  }
}
