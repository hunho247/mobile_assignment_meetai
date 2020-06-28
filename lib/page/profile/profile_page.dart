import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_assignment_meetai/utils/Constants.dart';
import 'package:mobile_assignment_meetai/widget/image_slide.dart';
import 'package:mobile_assignment_meetai/widget/myappbar.dart';

import 'profile_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isRating = false;
  bool _isLiked = false;
  double _appBarHeight = 50.0;

  @override
  void initState() {
    super.initState();
    ProfileBloc().add(LoadingProfileEvent("ammyvy"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: ProfileBloc(),
      builder: (BuildContext context, ProfileState state) {
        if (state.sSuccessful) {
          return _buildProfilePage(state);
        } else {
          return Center(
            child: SpinKitChasingDots(
              color: Constants.multiColors[Random().nextInt(3)],
            ),
          );
        }
      },
    );
  }

  Widget _buildProfilePage(ProfileState state) {
    return Scaffold(
      appBar: MyAppBar(
        name: state.vUser.name,
        image: state.vUser.images[0],
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
        child: _buildImagesSlider(state),
      ),
    );
  }

  Widget _buildImagesSlider(ProfileState state) {
    return Column(
      children: <Widget>[
        ImageSlide(
          state.vUser.images,
          width: 375,
          height: 350,
        ),
      ],
    );
  }
}
