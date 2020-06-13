import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index){
          setState(() => currentIndex = index);
        },
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Para ti')),
          BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados'))
        ],
      )
    );
  }
}