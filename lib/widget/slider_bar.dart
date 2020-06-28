import 'package:flutter/material.dart';
import 'package:mobile_assignment_meetai/utils/Constants.dart';

class SliderBar extends StatefulWidget {
  @override
  _SliderBarState createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> with TickerProviderStateMixin {
  GlobalKey _sliderKey = GlobalKey();
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
            thumbShape: _ThumbShape(),
            activeTrackColor: Constants.redColor,
            inactiveTrackColor: Constants.greyColor,
            trackHeight: 4.0,
            thumbColor: Constants.redColor,
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            showValueIndicator: ShowValueIndicator.always,
            valueIndicatorShape: _IndicatorShape(_value)),
        child: Slider(
          key: _sliderKey,
          value: _value,
          min: 0,
          max: 100,
          label: '$_value',
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
        ),
      ),
    );
  }
}

class _IndicatorShape extends SliderComponentShape {
  final double valueIndicator;
  final double width;

  const _IndicatorShape(this.valueIndicator, {this.width = 28.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(width);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;

    final icon = Icons.favorite;
    TextPainter textPainterx = TextPainter(textDirection: TextDirection.rtl);
    textPainterx.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: width,
        fontFamily: icon.fontFamily,
        color: Constants.redColor,
      ),
    );
    textPainterx.layout();

    final textSpan = TextSpan(
      text: valueIndicator.toInt().toString(),
      style: TextStyle(
        color: Constants.whiteColor,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: 50,
    );

    Offset toolTipOffset = Offset(center.dx - 14, center.dy - 38);
    Offset textOffset = Offset((toolTipOffset.dx + 14) - textPainter.width / 2,
        toolTipOffset.dy + 6.0);

    textPainterx.paint(canvas, toolTipOffset);
    textPainter.paint(canvas, textOffset);
  }
}

class _ThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double strokeWidth;

  const _ThumbShape({
    this.thumbRadius = 8.0,
    this.strokeWidth = 2.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = Constants.redColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, paint);
  }
}
