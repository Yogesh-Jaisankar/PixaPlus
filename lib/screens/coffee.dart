import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class coffee extends StatefulWidget {
  const coffee({Key? key}) : super(key: key);

  @override
  State<coffee> createState() => _coffeeState();
}

class _coffeeState extends State<coffee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
      child: ListView(
        children: [
          Lottie.asset("assets/lottie/coffee.json"),
          Text(
            "Appreciate me for this\nwonderful work!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          Text(
            "Your small donations will boost me\n to achieve great heights",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                //color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 20),
          Text(
            "Tap the button below and feel free to daonate",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                //color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 50),
          Column(
            children: [
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    launch('https://rzp.io/l/pxChoxl4');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Appreciate Me Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Terms and conditions applied.©️",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    //color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
