import 'package:flutter/material.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class RecommendationsPage extends StatefulWidget {

  @override
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> with AutomaticKeepAliveClientMixin {
  
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    return SafeArea(
      child: Scaffold(
        body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : NewsList(headlines)
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}