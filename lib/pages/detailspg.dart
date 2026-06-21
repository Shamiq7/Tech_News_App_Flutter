import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';

class Detailspg extends StatefulWidget {
  final Map detailItem;
  const Detailspg({super.key, required this.detailItem});

  @override
  State<Detailspg> createState() => _DetailspgState();
}

class _DetailspgState extends State<Detailspg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 20),
            Text(
              'Tech ',
              style: TextStyle(color: Appcolors.primary, fontSize: 30),
            ),
            Text(
              'News Details',
              style: TextStyle(color: Appcolors.white, fontSize: 30),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,

                  child: Image.network(
                    widget.detailItem['urlToImage'],
                    fit: BoxFit.contain,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.detailItem['publishedAt'],
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 40),
                    Text(
                      '${widget.detailItem['source']['name']}',

                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.detailItem['title'],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.detailItem['description'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.detailItem['content'],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                TextButton(onPressed: () {}, child: Text('Read More')),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
