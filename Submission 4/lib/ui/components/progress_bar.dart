import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ulab_blood_bank/res/colors/app_colors.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, this.dateCount = 0, this.progress = 0});

  final int dateCount;
  final double progress;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ProgressPainter(progress: widget.progress),
      child: SizedBox(
        width: 100,
        height: 56,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: AppColors.primaryPalette,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.dateCount} DAYS",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryPalette,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double progress;

  _ProgressPainter({required this.progress});

  final double strokeWidth = 30;
  final double radius = 90;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPainter = Paint()
      ..color = Color(0xFFF2F2F2)
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final foreGroundPainter = Paint()
      ..color = AppColors.primaryPalette
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double sweepAngle = lerpDouble(0, 2 * pi, progress * -1)!;

    canvas.drawCircle(size.center(Offset.zero), radius, backgroundPainter);
    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: radius,
      ),
      pi * (3 / 2),
      sweepAngle,
      false,
      foreGroundPainter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
