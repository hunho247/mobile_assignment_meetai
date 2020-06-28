import 'package:flutter/material.dart';
import 'package:mobile_assignment_meetai/page/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Assignment',
      home: _buildMainPage(context),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildMainPage(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          ProfilePage(),
        ],
      ),
    );
  }
}
