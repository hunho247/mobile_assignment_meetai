import 'package:flutter/material.dart';

class HeartPulse extends StatefulWidget {
  _HeartPulseState createState() => _HeartPulseState();
}

class _HeartPulseState extends State<HeartPulse>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Center(
        child: isLiked
            ? _AnimatedButton(animation: animation)
            : Image(image: AssetImage('assets/images/unlike_button.png')),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AnimatedButton extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.6, end: 1);

  _AnimatedButton({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Image(image: AssetImage('assets/images/heart_pulse.png')),
      ),
    );
  }
}
