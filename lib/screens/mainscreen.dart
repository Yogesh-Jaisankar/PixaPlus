import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pixaplus/screens/about.dart';
import 'package:pixaplus/screens/category.dart';
import 'package:pixaplus/screens/coffee.dart';
import 'package:pixaplus/screens/landingpage.dart';
import 'package:pixaplus/screens/trending.dart';
import 'package:pixaplus/screens/wallpaperscreen.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  int _currentindex = 0;
  final List<Widget> _children = [
    //wallpaper(),
    landingpage(),
    //category(),
    TrendingPage(),
    coffee(),
    about(),
  ];
  void onchanged(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Want to exit Pixaplus?'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.deepPurple;
                    return Colors.deepPurpleAccent;
                  }),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => exit(0),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.deepPurple;
                    return Colors.deepPurpleAccent;
                  }),
                ),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    int currentinex = 0;
    currentinex = _currentindex;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _children[_currentindex],
        bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
                //tabBackgroundColor: Colors.,
                backgroundColor: Colors.black87,
                gap: 8,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                onTabChange: onchanged,
                tabs: [
                  GButton(
                    icon: Icons.picture_in_picture,
                    //iconSize: 30,
                    iconActiveColor: Colors.deepPurpleAccent,
                    iconColor: Colors.deepPurpleAccent,
                    text: "Wallpapers",
                  ),
                  GButton(
                    icon: Icons.category,
                    //iconSize: 30,
                    iconActiveColor: Colors.green,
                    iconColor: Colors.green,
                    text: "Trending",
                  ),
                  GButton(
                    icon: Icons.coffee,
                    // iconSize: 30,
                    iconActiveColor: Colors.red[400],
                    iconColor: Colors.red[400],
                    text: "Donate",
                  ),
                  GButton(
                    icon: Icons.stacked_bar_chart,
                    //iconSize: 30,
                    iconActiveColor: Colors.indigoAccent,
                    iconColor: Colors.indigoAccent,
                    text: "About",
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
