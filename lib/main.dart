import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tech_news_app/pages/startpg.dart';
import 'package:tech_news_app/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Appcolors.primary,
      ),
      home: Startpg(),
    );
  }
}



//api key from newsapp.org
//test api at postman
//got dependencies from pubdev
//add url launcher so that we can go from our app -> article 








// ================= HOW CALLBACKS WORK =================
//
// Use normal variables (String, Map, List) when passing DATA.
//
// Examples:
// final String title;      -> one value
// final Map article;       -> one object
// final List articles;     -> many objects
//
// Use a Function when passing an ACTION.
//
// Example:
// final Function(String) onSearch;
//
// We use onSearch because Searchbar does NOT own the news data.
// The news Future and FutureBuilder live in Startpg.
//
// Flow:
//
// User types "apple"
//        ↓
// Searchbar
//        ↓
// widget.onSearch("apple")
//        ↓
// Startpg receives "apple"
//        ↓
// setState(() {
//   news = fetchNews("apple");
// })
//        ↓
// FutureBuilder rebuilds
//        ↓
// New articles appear
//
// Rule of thumb:
// DATA   -> String, int, bool, Map, List
// ACTION -> Function, VoidCallback, onTap, onPressed, onSearch
//
// ======================================================