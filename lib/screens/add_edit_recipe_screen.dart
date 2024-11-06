import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'package:uuid/uuid.dart';

class AddEditRecipeScreen extends StatefulWidget {
  final Recipe? recipe;

  AddEditRecipeScreen({this.recipe});

  @override
  _AddEditRecipeScreenState createState() => _AddEditRecipeScreenState();
}

class _AddEditRecipeScreenState extends State<AddEditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      _nameController.text = widget.recipe!.name;
      _descriptionController.text = widget.recipe!.description;
    }
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      final newRecipe = Recipe(
        id: widget.recipe?.id ?? Uuid().v4(),
        name: _nameController.text,
        description: _descriptionController.text,
      );
      Navigator.of(context).pop(newRecipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe == null ? "Adicionar Receita" : "Editar Receita")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nome do Prato"),
                validator: (value) => value!.isEmpty ? "Informe o nome do prato" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Descrição"),
                maxLines: null,
                validator: (value) => value!.isEmpty ? "Informe a descrição" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveRecipe,
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}