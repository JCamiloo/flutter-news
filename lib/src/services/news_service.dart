import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/models/news_model.dart';
import 'package:news/src/models/category_model.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'e8496a7ca3f24daeb8e157a02dd5877e';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = 'business';
  Map<String, List<Article>> categoryNews = {};
  bool _isLoading = true;
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  NewsService() {
    this.getTopHeadlines();
    this.categories.forEach((category) => categoryNews[category.name] = List());
    this.getArticlesByCategory(this.selectedCategory);
  }

  String get selectedCategory => this._selectedCategory;
  
  set selectedCategory(String value) {
    this._selectedCategory = value;
    this._isLoading = true;
    this.getArticlesByCategory(this.selectedCategory);
    notifyListeners();
  }

  bool get isLoading => this._isLoading;

  List<Article> get selectedCategoryNews => this.categoryNews[this.selectedCategory];

  getTopHeadlines() async {
    final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryNews[category].length > 0) {
      this._isLoading = false;
      notifyListeners();
      return this.categoryNews[category];
    }

    final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co&category=$category';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.categoryNews[category].addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }
}