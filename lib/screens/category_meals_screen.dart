import 'package:flutter/material.dart';
import 'package:udemy_complete_guy02/dummy_data.dart';
import 'package:udemy_complete_guy02/models/meal.dart';
import 'package:udemy_complete_guy02/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadInitData=false;


  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {

    if(!_loadInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
