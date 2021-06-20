import 'package:flutter/material.dart';
import 'dart:ui';

class CardGlass extends StatelessWidget {
  const CardGlass(
      {Key? key,
      required this.child,
      this.height = 200.0,
      this.width = 300.0,
      this.borderRadius = const BorderRadius.all(Radius.circular(16))})
      : assert(child != null),
        super(key: key);

  final Widget child;
  final double height;
  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        borderRadius: this.borderRadius,
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment(1, 1),
          end: Alignment(-1, -1.5),
        ),
      ),
      child: ClipRRect(
        borderRadius: this.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.1),
              ),
              this.child
            ],
          ),
        ),
      ),
    );
  }
}
