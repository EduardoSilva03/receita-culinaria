import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'add_edit_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [];

  void _addRecipe(Recipe recipe) {
    setState(() {
      recipes.add(recipe);
    });
  }

  void _editRecipe(String id, Recipe updatedRecipe) {
    setState(() {
      final index = recipes.indexWhere((recipe) => recipe.id == id);
      if (index != -1) {
        recipes[index] = updatedRecipe;
      }
    });
  }

  void _removeRecipe(String id) {
    setState(() {
      recipes.removeWhere((recipe) => recipe.id == id);
    });
  }

  void _openAddEditRecipeScreen({Recipe? recipe}) async {
    final newRecipe = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditRecipeScreen(recipe: recipe),
      ),
    );

    if (newRecipe != null) {
      recipe == null ? _addRecipe(newRecipe) : _editRecipe(recipe.id, newRecipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Receitas Culinárias")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            subtitle: Text(recipe.description),
            onTap: () => _openAddEditRecipeScreen(recipe: recipe),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeRecipe(recipe.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddEditRecipeScreen(),
      ),
    );
  }
}