import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class wallpaper extends StatefulWidget {
  const wallpaper({Key? key}) : super(key: key);

  @override
  State<wallpaper> createState() => _wallpaperState();
}

class _wallpaperState extends State<wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pixaplus"),
        elevation: 0.0,
      ),
      //backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0x33333),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search Wallpapers",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurpleAccent)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurple))),
                    ),
                  ),
                  LottieBuilder.asset(
                    "assets/lottie/search.json",
                    height: 70,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
