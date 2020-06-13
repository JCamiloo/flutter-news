import 'package:flutter/material.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class RecommendationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    return Container(
      child: NewsList(headlines)
    );
  }
}