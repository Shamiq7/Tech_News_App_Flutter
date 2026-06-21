import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/newsfunc.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tech',
                style: TextStyle(color: Appcolors.primary, fontSize: 30),
              ),
              Text(
                'Newz',
                style: TextStyle(color: Appcolors.white, fontSize: 30),
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

                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final item = articles[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              height: 60,
                              width: 80,
                              color: Colors.grey.shade100,
                              child: item['urlToImage'] != null
                                  ? Image.network(
                                      item['urlToImage'],
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      'images/pic3.png',
                                      fit: BoxFit.fill,
                                    ),
                            ),
                            title: Text(
                              item['title'] ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              item['publishedAt'],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
