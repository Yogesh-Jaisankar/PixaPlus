import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
// @dart=2.9
import 'package:photo_view/photo_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FullScreen extends StatefulWidget {
  var imgPath, img;

  FullScreen(this.imgPath, this.img);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  static const platform = const MethodChannel("com.flutter.epic/epic");
  bool isPressed = false;
  var progress;
  var _setWallpaper = "PIXAPLUS";
  var setwallbar = false;
  _save() async {
    setState(() {
      progheight = 40.0;
    });
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var response = await Dio().get(widget.imgPath,
          options: Options(responseType: ResponseType.bytes));
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      print(result);
      return result;
    } else if (status.isDenied) {
      throw ("You need to give storage permission");
    } else if (status.isRestricted) {
      openAppSettings();
    }
  }

  Future _download(var value, var width) async {
    Dio dio = new Dio();
    try {
      var dir = await getTemporaryDirectory();
      await dio.download(widget.imgPath, "${dir.path}/pixaplus.jpeg",
          onReceiveProgress: (rec, total) {
        setState(() {
          progress = ((rec / total) * 100);
          progheight = (progress / 100) * width;
          _setWallpaper = progress.toStringAsFixed(0) + "%";
          print(progress);
          if (progress == 100) {
            _setWall(value);
          }
        });
      });
    } catch (_) {
      print(_);
    }
    setState(() {
      progress = "Done!";
    });
  }

  Future _setWall(var value) async {
    String setWallpaper;
    try {
      var result =
          await platform.invokeMethod("setWall", "pixaplus.jpeg $value");
      print(result);
      setWallpaper = "Wallpaper Updated Successfully";
    } on PlatformException catch (_) {
      setWallpaper = "Failed to Set Wallpaper";
    }
    setState(() {
      _setWallpaper = setWallpaper;
    });
  }

  var progs = 0;
  var isClicked = false;
  var progheight = 0.0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isPressed = !isPressed;
                      setwallbar = false;
                    });
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.white,
                    child: PhotoView(
                      backgroundDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 39, 51),
                      ),
                      tightMode: true,
                      initialScale: PhotoViewComputedScale.covered,
                      minScale: PhotoViewComputedScale.covered,
                      maxScale: PhotoViewComputedScale.contained,
                      imageProvider: new AdvancedNetworkImage(widget.imgPath,
                          useDiskCache: true,
                          loadingProgress: (progress, data) {
                        setState(() {
                          progs = (progress * 100).toInt();
                        });
                      }, cacheRule: CacheRule(maxAge: const Duration(days: 7))),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: double.infinity,
            child: progs > 98 || progs == 0
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 35),
                    child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: Text(
                          "$progs",
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                  ),
          ),
          Material(
            elevation: 8,
            color: Color.fromARGB(255, 16, 39, 51),
            child: Container(
                width: double.infinity,
                color: Colors.black54,
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    setwallbar
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    _download("home", width);
                                    setState(() {
                                      isClicked = true;
                                    });
                                  },
                                  child: Container(
                                    height: 33,
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 16, 39, 51),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text("HOMESCREEN",
                                        textScaleFactor: 0.8,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _download("lock", width);
                                    setState(() {
                                      isClicked = true;
                                    });
                                  },
                                  child: Container(
                                    height: 33,
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 16, 39, 51),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text("LOCKSCREEN",
                                        textScaleFactor: 0.8,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _download("both", width);
                                    setState(() {
                                      isClicked = true;
                                    });
                                  },
                                  child: Container(
                                    height: 33,
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 16, 39, 51),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text("BOTH",
                                        textScaleFactor: 0.8,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.file_download,
                                  color: Colors.white,
                                  size: 26,
                                ),
                                onPressed: () async {
                                  var u = await _save();
                                  isClicked = true;
                                  if (u != null) {
                                    setState(() {
                                      progheight = width;
                                      _setWallpaper = "Image Saved to Gallery";
                                    });
                                  }
                                },
                              ),
                              FilterChip(
                                label: Text(
                                  "Set Wallpaper",
                                  style: TextStyle(color: Colors.black),
                                  textScaleFactor: 0.9,
                                ),
                                onSelected: (bool value) {
                                  setState(() {
                                    isPressed = true;
                                    setwallbar = true;
                                  });
                                },
                                backgroundColor: Colors.white,
                                avatar: Icon(
                                  Icons.color_lens,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                  size: 26,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPressed = !isPressed;
                                  });
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 10),
                          height: 50,
                          width: progheight,
                          color: Colors.teal.shade400,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            _setWallpaper,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
