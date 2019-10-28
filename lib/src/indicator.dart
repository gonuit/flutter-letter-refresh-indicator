import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

import 'triangle_painter.dart';

class LetterIndicator extends StatelessWidget {
  final CustomRefreshIndicatorData data;
  final Color accent;

  static const _circleSize = 70.0;

  static const _defaultShadow = [
    BoxShadow(blurRadius: 10, color: Colors.black26)
  ];

  LetterIndicator({
    @required this.data,
    this.accent,
  }) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final widgetWidth = constraints.maxWidth;
      final widgetHeight = constraints.maxHeight;
      final letterTopWidth = (widgetWidth / 2) + 50;

      final leftValue = (widgetWidth - (letterTopWidth * data.value / 1))
          .clamp(letterTopWidth - 100, double.infinity);

      final rightValue = (widgetWidth - (widgetWidth * data.value / 1))
          .clamp(0.0, double.infinity);

      final opacity = (data.value - 1).clamp(0, 0.5) / 0.5;

      return Stack(
        children: <Widget>[
          Positioned(
            right: rightValue,
            child: Container(
              height: widgetHeight,
              width: widgetWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: _defaultShadow,
              ),
            ),
          ),
          Positioned(
            left: leftValue,
            child: CustomPaint(
              painter: TrianglePainter(
                strokeColor: Colors.white,
                paintingStyle: PaintingStyle.fill,
              ),
              child: Container(
                height: widgetHeight,
                width: letterTopWidth,
              ),
            ),
          ),
          if (data.value >= 1)
            Container(
              padding: const EdgeInsets.only(right: 100),
              child: Transform.scale(
                scale: data.value,
                child: Opacity(
                  opacity: data.isLoading ? 1 : opacity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: _circleSize,
                      height: _circleSize,
                      decoration: BoxDecoration(
                        boxShadow: _defaultShadow,
                        color: accent ?? Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.black),
                              value: data.isLoading ? null : 0,
                            ),
                          ),
                          Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      );
    });
  }
}
