import 'package:flutter/material.dart';
import 'package:udemy_complete_guy02/widgets/main_drawer.dart';

import 'Favourite.dart';
import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> _pages=[
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavouriteScreen(),'title':'Your Favorite'}
  ];

  int _selectedPageIndex=0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star), title: Text('Favorite')),
        ],
      ),
    );
  }
}
