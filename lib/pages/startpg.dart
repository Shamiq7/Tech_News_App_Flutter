import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/newsfunc.dart';
import 'package:tech_news_app/components/newscard.dart';
import 'package:tech_news_app/modals/list.dart';
import 'package:tech_news_app/utils/colors.dart';
// import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class Startpg extends StatefulWidget {
  const Startpg({super.key});

  @override
  State<Startpg> createState() => _StartpgState();
}

class _StartpgState extends State<Startpg> {
  final newsController = TextEditingController(text: '');
  late Future<List> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchNews('technology');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              SizedBox(width: 123),
              Text(
                'Tech',
                style: TextStyle(color: Appcolors.primary, fontSize: 30),
              ),
              Text(
                'Newz',
                style: TextStyle(color: Appcolors.white, fontSize: 30),
              ),
              SizedBox(width: 65),
              IconButton(
                onPressed: () {
                  setState(() {
                    news = fetchNews('technology');
                  });
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: Row(
                children: [
                  Container(
                    width: 310,
                    height: 53,
                    child: TextField(
                      controller: newsController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Appcolors.darkgrey,
                        hintText: '  Enter News To Search',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Appcolors.darkgrey,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          news = fetchNews(newsController.text);
                        });
                      },
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: FutureBuilder<List>(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'No News Found',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }
                  print(snapshot.data);
                  List articles = snapshot.data!;

                  return Newscard(newsitem: articles);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
