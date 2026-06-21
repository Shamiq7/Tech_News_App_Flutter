import 'package:flutter/material.dart';

class Newscard extends StatefulWidget {
  final List newsitem;
  const Newscard({super.key,required this.newsitem});

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
    ;
  }
}
