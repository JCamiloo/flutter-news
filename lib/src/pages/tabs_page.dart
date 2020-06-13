import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news/src/pages/recommendations_page.dart';

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return Scaffold(
      body: PageView(
        controller: navigationModel.pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) => navigationModel.currentPage = index,
        children: <Widget>[
          RecommendationsPage(),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (index) => navigationModel.currentPage = index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Para ti')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados'))
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {

  int _currentPage = 0;
  PageController _pageController = PageController();

  int get currentPage => this._currentPage;

  set currentPage(int value) {
    this._currentPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}