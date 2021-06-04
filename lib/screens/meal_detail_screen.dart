import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_complete_guy02/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ))),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                      title: Text(selectedMeal.steps[index]),

                        ),
                    Divider()
                  ],
                )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete
        ),
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: 300,
        child: child);
  }
}
