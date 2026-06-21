import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/newsfunc.dart';
import 'package:tech_news_app/utils/colors.dart';

class Searchbar extends StatefulWidget {
  final Function(String) onSearch;
  final TextEditingController controllerr;
  const Searchbar({
    super.key,
    required this.onSearch,
    required this.controllerr,
  });

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchNews('technology');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 310,
          height: 53,
          child: TextField(
            controller: widget.controllerr,
            decoration: InputDecoration(
              filled: true,
              fillColor: Appcolors.darkgrey,
              hintText: '  Enter News To Search',
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1.5, style: BorderStyle.solid),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1.5, style: BorderStyle.solid),
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
              // setState(() {
              //   news = fetchNews(newsController.text);
              // });
              widget.onSearch(widget.controllerr.text);
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
