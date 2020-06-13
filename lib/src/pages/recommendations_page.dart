import 'package:flutter/material.dart';
import 'package:news/src/services/news_service.dart';
import 'package:provider/provider.dart';

class RecommendationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Container(
      child: Center(child: Text('Hola mundo'),),
    );
  }
}