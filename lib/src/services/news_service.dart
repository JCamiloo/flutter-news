import 'package:flutter/material.dart';
import 'package:news/src/models/news_model.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'e8496a7ca3f24daeb8e157a02dd5877e';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  
  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

}