import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixaplus/screens/mainscreen.dart';
import 'package:pixaplus/screens/splash.dart';
import 'package:pixaplus/screens/welcomescreeen.dart';
import 'package:shared_preferences/shared_preferences.dart';

var initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixaplus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home': (context) => mainscreen(),
        'onboard': (context) => welcome(),
      },
    );
  }
}
