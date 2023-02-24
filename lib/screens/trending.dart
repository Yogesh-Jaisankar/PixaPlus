import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'package:pixaplus/screens/fullscreen.dart';

class TrendingPage extends StatelessWidget {
  var darktheme;
  TrendingPage();
  @override
  List apikeys = ["563492ad6f91700001000001a336f647a577449cb6758e560956df12"];
  Future getWallPaper() async {
    List<ApiData> data = [];
    var url = "https://api.pexels.com/v1/curated?per_page=400&page=1";
    var apikey = apikeys[Random().nextInt(apikeys.length)];
    await http
        .get(Uri.parse(url), headers: {"Authorization": apikey}).then((value) {
      var decodedJson = jsonDecode(value.body);
      ApiData apiData;
      decodedJson["photos"].forEach((element) {
        apiData = ApiData(element["src"]["portrait"]);
        data.add(apiData);
        print(data[0].link);
      });
    });

    return data;
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
              title: Text(
            "Trending",
            textScaleFactor: 0.8,
            style: TextStyle(color: Colors.white),
          )),
          body: FutureBuilder(
              future: getWallPaper(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return (snapshot.data == null)
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF6C63FF)),
                          backgroundColor: Colors.white,
                        ),
                          SizedBox(height: 20),
                          Text("Loading time depens on your network speed 📶",textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                          ),

                      ],),)
                    : GridView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          String imgPath = snapshot.data[i].link;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return FullScreen(imgPath, imgPath);
                                }));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: new FadeInImage(
                                    image: new AdvancedNetworkImage(
                                      imgPath,
                                      useDiskCache: true,
                                      cacheRule: CacheRule(
                                          maxAge: const Duration(days: 7)),
                                    ),
                                    fit: BoxFit.cover,
                                    placeholder:
                                        AssetImage("assets/images/load.gif")),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (width / 2.5) / 300));
              }),
        ));
  }
}

class ApiData {
  final String link;
  ApiData(this.link);
}
