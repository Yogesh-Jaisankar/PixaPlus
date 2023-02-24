import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Lottie.asset("assets/lottie/doc.json", height: 250),
            Text(
              "Pixaplus",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Text(
              "This app is developed using flutter\nand powered by pexels api\nwhich gives the best and smooth\nuser experiance.\n\nNew wallpapers are updated everyday automatically.\n\nDownload high resolution wallpapers and\nbeautify your mobile phone.\n\nPixaplus always tries to give the best user experience\n\nThanks for downloading!❤️",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                  //color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                launch(
                    "https://www.freeprivacypolicy.com/live/3a019204-d3e5-46eb-8849-2c0e044b2715");
              },
              child: Text(
                "Privacy & Policy",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    color: Colors.blue,
                    //color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
