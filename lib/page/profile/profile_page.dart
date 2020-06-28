import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_meetai/widget/image_slide.dart';
import 'package:mobile_assignment_meetai/widget/myappbar.dart';

import 'profile_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isRating = false;
  bool _isLiked = false;
  double _appBarHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: ProfileBloc(),
      builder: (BuildContext context, ProfileState state) {
        return Scaffold(
          appBar: MyAppBar(
            name: 'Amy Nguyen',
            image: 'assets/images/profile_pic.png',
            isRating: _isRating,
            isLiked: _isLiked,
            height: _appBarHeight,
            onTapLikeButton: (val) {
              if (!_isRating) {
                setState(() {
                  _isRating = val;
                  _isLiked = val;

                  if (val) {
                    _appBarHeight = 100.0;
                  } else {
                    _appBarHeight = 50.0;
                  }
                });
              }
            },
          ),
          body: GestureDetector(
            onTap: () {
              setState(() {
                _isRating = false;
                _appBarHeight = 50.0;
              });
            },
            child: _buildProfilePage(),
          ),
        );
      },
    );
  }

  Widget _buildProfilePage() {
    return Column(
      children: <Widget>[
        ImageSlide(
          imgList,
          width: 375,
          height: 350,
        ),
      ],
    );
  }
}
