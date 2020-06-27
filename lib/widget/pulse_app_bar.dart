import 'package:flutter/material.dart';

import 'heart_pulse.dart';

class PulseAppBar extends PreferredSize {
  final String name;
  final String image;
  final double height;

  const PulseAppBar({
    @required this.name,
    @required this.image,
    @required this.height,
  });

  @override
  get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 16.0),
            CircleAvatar(radius: 14.0, backgroundImage: AssetImage(image)),
            SizedBox(width: 12.0),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 20),
            Container(
              margin: EdgeInsets.only(right: 8.0),
              width: 38,
              height: 34,
              child: HeartPulse(),
            ),
          ],
        ),
      ),
    );
  }
}
