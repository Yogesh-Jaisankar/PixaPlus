import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixaplus/screens/mainscreen.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: Text(""),elevation: 0,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "PIXAPLUS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Lottie.asset("assets/lottie/wel.json", width: 300),
                    SizedBox(height: 50),
                    Text(
                      "Download the best HD wallpapers for you device in 4k resolution",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => mainscreen()),
                          );
                        },
                        child: Lottie.asset("assets/lottie/but.json",width: 600)),

                    Text(
                      "Made in India with ❤️",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          //fontWeight: FontWeight.bold),
                    ),
                    )],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
