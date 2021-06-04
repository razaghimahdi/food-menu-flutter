import 'package:flutter/material.dart';
import 'package:udemy_complete_guy02/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Coocking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);

          }),
        ],
      ),
    );
  }


  Widget buildListTile(String title,IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      onTap: tapHandler,
    );
  }

}
