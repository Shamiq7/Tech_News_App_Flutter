import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_news_app/pages/startpg.dart';
import 'package:tech_news_app/utils/api.dart';

Future<List> fetchNews(String searchQuery) async {
  var response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/everything?q=$searchQuery&pageSize=100&apiKey=$apiKey',
    ),
  );
  // print(response.body);
  Map res = jsonDecode(response.body);
  print('//////////////Got Data//////////////////');
  // print(res);
  return res['articles'];
}
//why are we returning only res['articles], because here on our api response is like this 
// {
//     "status": "ok",
//     "totalResults": 37,
//     "articles": [
//         {
//             "source": {
//                 "id": null,
// so here we have a map but we are only intrested in the list provided by the articles 