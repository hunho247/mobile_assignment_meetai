import 'package:flutter/material.dart';

class HeartPulse extends StatefulWidget {
  final bool isLiked;
  final Function(bool) onTap;

  HeartPulse({
    this.isLiked = false,
    this.onTap,
  });

  _HeartPulseState createState() => _HeartPulseState();
}

class _HeartPulseState extends State<HeartPulse>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap(!widget.isLiked);
        });
      },
      child: Center(
        child: widget.isLiked
            ? _AnimatedButton(animation: _animation)
            : Image(image: AssetImage('assets/images/unlike_button.png')),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
