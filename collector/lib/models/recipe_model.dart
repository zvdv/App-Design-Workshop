// import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class RecipeModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String imagePath;

  @HiveField(2)
  String ingredients;

  @HiveField(3)
  String steps;

  RecipeModel({
    required this.title,
    required this.imagePath,
    required this.ingredients,
    required this.steps
  });
}