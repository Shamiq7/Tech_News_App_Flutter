import 'package:flutter/material.dart';
import 'package:tech_news_app/pages/detailspg.dart';
import 'package:tech_news_app/utils/colors.dart';

class Newscard extends StatefulWidget {
  final List newsitem;
  const Newscard({super.key, required this.newsitem});

  @override
  State<Newscard> createState() => _NewscardState();
}

class _NewscardState extends State<Newscard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.newsitem.length,
      itemBuilder: (context, index) {
        final item = widget.newsitem[index];
        return Column(
          children: [
            ListTile(
              onTap: () {
                _bottomsheet(context, item);
              },
              leading: Container(
                height: 60,
                width: 80,
                color: Colors.grey.shade100,
                child: item['urlToImage'] != null
                    ? Image.network(item['urlToImage'], fit: BoxFit.fill)
                    : Image.asset('images/pic3.png', fit: BoxFit.fill),
              ),
              title: Text(
                item['title'] ?? '',
                style: TextStyle(color: Colors.white, fontSize: 18),
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
  }

  void _bottomsheet(BuildContext context, Map item) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Appcolors.darkgrey,
          height: 300,

          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'] ?? '', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text(
                  item['description'] ?? 'No Description Available',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailspg(detailItem: item),
                        ),
                      );
                    },
                    child: Text('Read More'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
