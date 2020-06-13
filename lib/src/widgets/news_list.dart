import 'package:flutter/material.dart';
import 'package:news/src/models/news_model.dart';
import 'package:news/src/theme/theme.dart';

class NewsList extends StatelessWidget {

  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
      return _New(newsArticle: this.news[index], index: index);
     },
    );
  }
}

class _New extends StatelessWidget {

  final Article newsArticle;
  final int index;

  const _New({ @required this.newsArticle, @required this.index });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(newsArticle, index),
        _CardTitle(newsArticle),
        _CardImage(newsArticle),
        _CardBody(newsArticle),
        _CardButtons(),
        SizedBox(height: 10),
        Divider()
      ],
    );
  }
}

class _CardButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: theme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox( width: 10 ),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _CardBody extends StatelessWidget {

  final Article newsArticle;
  
  const _CardBody(this.newsArticle); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((newsArticle.description != null) ? newsArticle.description : ''),
    );
  }
}

class _CardImage extends StatelessWidget {

  final Article newsArticle;
  
  const _CardImage(this.newsArticle); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (newsArticle.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(newsArticle.urlToImage),
                  fit: BoxFit.cover,
                )
              : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {

  final Article newsArticle;
  
  const _CardTitle(this.newsArticle); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(newsArticle.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  
  final Article newsArticle;
  final int index;
  
  const _CardTopBar(this.newsArticle, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle(color: theme.accentColor)),
          Text('${newsArticle.source.name}')
        ],
      ),
    );
  }
}