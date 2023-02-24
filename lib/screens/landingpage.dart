import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixaplus/screens/search.dart';
import 'package:pixaplus/widgets/categorytile.dart';

class landingpage extends StatefulWidget {
  const landingpage({Key? key}) : super(key: key);

  @override
  State<landingpage> createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  TextEditingController t = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/images/background.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi There ! 😍",
                              textAlign: TextAlign.start,
                              textScaleFactor: 0.8,
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Row(
                              children: <Widget>[
                                new Text(
                                  "Welcome To Pixa",
                                  textAlign: TextAlign.start,
                                  textScaleFactor: 0.8,
                                  style: TextStyle(
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new Text(
                                  "Plus",
                                  textAlign: TextAlign.start,
                                  textScaleFactor: 0.8,
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                          color: Color.fromARGB(255, 40, 63, 77),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.40,
                            height: MediaQuery.of(context).size.height / 17,
                            child: Center(
                              child: TextField(
                                controller: t,
                                onSubmitted: (t1) => {
                                  Navigator.of(context).push(
                                      MaterialPageRoute<Null>(
                                          builder: (BuildContext context) {
                                    return searchpage(t.text);
                                  })),
                                },
                                style: TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white70,
                                  ),
                                  hintText: "Search wallpaper type etc..",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 25),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CategoryTile(0),
                              CategoryTile(1),
                              CategoryTile(2),
                            ]),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CategoryTile(
                              3,
                            ),
                            CategoryTile(
                              4,
                            ),
                            CategoryTile(
                              5,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CategoryTile(6),
                            CategoryTile(7),
                            Container(
                              height: height / 20,
                              width: width / 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ])
              ],
            )),
      ),
    );
  }
}
