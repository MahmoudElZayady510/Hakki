import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readify/Screens/BookDetails.dart';
import 'package:readify/Screens/BookDetails01.dart';
import 'package:readify/Screens/BookDetails02.dart';
import 'package:readify/Screens/Explore.dart';
import 'package:readify/Screens/More.dart';
import 'package:readify/Screens/MyTabBar.dart';
import 'package:readify/Screens/Notifications.dart';
import 'package:readify/Screens/PDF.dart';
import 'package:readify/Screens/Recommended.dart';
import 'package:readify/Screens/Screen.dart';
import 'package:readify/Screens/SignIn.dart';
import 'package:readify/Screens/SignUp.dart';
import 'package:readify/Screens/Trending.dart';
import 'package:readify/Screens/ContinueReading.dart';
import 'package:readify/Screens/User.dart';
import 'package:readify/Screens/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/Home.dart';
import 'Screens/PDF01.dart';
import 'Screens/Splash.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int activeindex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetLoadingIndicatorPreference();

  }
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('ar','AE'), // English
      // ],
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        // 'home' : (context) => Home(),
        // 'explore' :(context) => Explore(),
        'screen' : (context) => Screen(),
        'pdf' : (context) => PDF(),
        'pdf01' : (context) => PDFF(),
        'bookDetails' : (context) => BookDetails(),
        'bookDetails01' : (context) => BookDetailsS(),
        'bookDetails02' : (context) => BookDetailsSS(),
        'cntReading' : (context) => ContinueReading(),
        'Recommended' : (context) => Recommended(),
        'trending' : (context) => Trending(),
        'signIn' : (context) => SignIn(),
        'signUp' : (context) => SignUp(),
        'chat' : (context) => ChatbotPage(),
        'notifications' : (context) => Notifications(),
        'splash' : (context) => SplashScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Bein',
      ),
    );
  }
}
Future<void> resetLoadingIndicatorPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('hasLoadedBefore');
}


