import 'package:flutter/material.dart';
import 'package:news/src/models/category_model.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context); 

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _CategoriesList(),
            (newsService.isLoading)
            ? Expanded(child: Center( child: CircularProgressIndicator()))
            : Expanded(child: NewsList(newsService.selectedCategoryNews)),
          ],
        ),
      )
    );
  }
}

class _CategoriesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                CategoryIcon(categories[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1).toLowerCase()}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {

  final Category category;

  const CategoryIcon(this.category);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon, 
          color: (newsService.selectedCategory == category.name) ? Colors.red : Colors.black54 
        )
      )
    );
  }
}