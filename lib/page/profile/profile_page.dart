import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_assignment_meetai/model/moment.dart';
import 'package:mobile_assignment_meetai/model/user.dart';
import 'package:mobile_assignment_meetai/utils/Constants.dart';
import 'package:mobile_assignment_meetai/utils/Time.dart';
import 'package:mobile_assignment_meetai/widget/image_gird.dart';
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
    ProfileBloc().add(LoadingMomentEvent("ammyvy"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: ProfileBloc(),
      builder: (BuildContext context, ProfileState state) {
        if (state.sLoadingSuccessUser) {
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
    User user = state.vUser;

    return Scaffold(
      appBar: MyAppBar(
        name: user.name,
        image: user.images[0],
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildImagesSlider(user),
              const SizedBox(height: 0.0),
              _buildProfileContent(user),
              const SizedBox(height: 35.0),
              _buildMomentContent(state),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagesSlider(User user) {
    return Column(
      children: <Widget>[
        ImageSlide(
          user.images,
          height: 350.0,
        ),
      ],
    );
  }

  Widget _buildProfileContent(User user) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          const SizedBox(width: 16),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Constants.textColor,
            ),
          ),
        ]),
        const SizedBox(height: 13),
        Row(children: <Widget>[
          const SizedBox(width: 16),
          Image(
              width: 18.0,
              height: 18.0,
              image: AssetImage('assets/images/img_age.png')),
          const SizedBox(width: 12),
          Text(
            Time.timestamp2Date(user.birthdate),
            style: TextStyle(
              fontSize: 16.0,
              color: Constants.textColor,
            ),
          ),
        ]),
        const SizedBox(height: 11),
        Row(children: <Widget>[
          const SizedBox(width: 16),
          Image(
              width: 18.0,
              height: 18.0,
              image: AssetImage('assets/images/img_work.png')),
          const SizedBox(width: 12),
          Text(
            user.work,
            style: TextStyle(
              fontSize: 16.0,
              color: Constants.textColor,
            ),
          ),
        ]),
        const SizedBox(height: 11),
        Row(children: <Widget>[
          const SizedBox(width: 16),
          Image(
              width: 18.0,
              height: 18.0,
              image: AssetImage('assets/images/img_university.png')),
          const SizedBox(width: 12),
          Text(
            user.education,
            style: TextStyle(
              fontSize: 16.0,
              color: Constants.textColor,
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 17, left: 16.0, right: 16.0),
          child: Text(
            user.bio,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              color: Constants.text2Color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMomentContent(ProfileState state) {
    Moment moment = state.vMoment;

    if (state.sLoadingSuccessMoment) {
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ImageGird(moment.images, moment.location),
      );
    } else {
      return Center(
          child: Text(
        'No moments',
        style: TextStyle(
          fontSize: 18.0,
          color: Constants.textColor,
        ),
      ));
    }
  }
}
