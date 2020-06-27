import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_meetai/page/profile/profile_page.dart';

import 'main_bloc.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: MainBloc(),
      builder: (BuildContext context, MainState state) {
        return MaterialApp(
          title: 'Mobile Assignment',
          home: _buildMainPage(context, state),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  Widget _buildMainPage(BuildContext context, MainState state) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          ProfilePage(),
        ],
      ),
    );
  }
}
