import 'package:flutter/material.dart';
import 'package:mobile_assignment_meetai/utils/Constants.dart';

import 'heart_pulse.dart';
import 'slider_bar.dart';

class MyAppBar extends PreferredSize {
  final String name;
  final String image;
  final double height;
  final bool isRating;
  final bool isLiked;
  final Function(bool) onTapLikeButton;

  const MyAppBar({
    @required this.name,
    @required this.image,
    this.height = 50,
    this.isRating = false,
    this.isLiked = false,
    this.onTapLikeButton,
  });

  @override
  get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isRating ? _buildHeartAppbar(context) : _buildProfileAppbar(context);
  }

  Widget _buildProfileAppbar(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16.0),
          CircleAvatar(radius: 14.0, backgroundImage: NetworkImage(image)),
          const SizedBox(width: 12.0),
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
            child: HeartPulse(
              isLiked: isLiked,
              onTap: onTapLikeButton,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartAppbar(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 17.0),
          Row(
            children: <Widget>[
              const SizedBox(width: 16.0),
              Image(
                image: AssetImage('assets/images/like_button.png'),
              ),
              const SizedBox(width: 12.0),
              Text(
                'How much do you likes ${name}?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Constants.textColor,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
          const SizedBox(height: 34.0),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: SliderBar(),
          ),
        ],
      ),
    );
  }
}
