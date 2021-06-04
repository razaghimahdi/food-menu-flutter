import 'package:flutter/material.dart';
import 'package:udemy_complete_guy02/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName='/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),),
      drawer: MainDrawer(),
      body: Center(child:
    Text('Filters!'),),);
  }
}
