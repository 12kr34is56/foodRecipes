import 'dart:convert';
RecipeModels recipeModelsFromJson(String str) => RecipeModels.fromJson(json.decode(str));
String recipeModelsToJson(RecipeModels data) => json.encode(data.toJson());
class RecipeModels {
  RecipeModels({
      this.name,
      this.steps,});

  RecipeModels.fromJson(dynamic json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = [];
      json['steps'].forEach((v) {
        steps?.add(Steps.fromJson(v));
      });
    }
  }
  String? name;
  List<Steps>? steps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (steps != null) {
      map['steps'] = steps?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Steps stepsFromJson(String str) => Steps.fromJson(json.decode(str));
String stepsToJson(Steps data) => json.encode(data.toJson());
class Steps {
  Steps({
      this.number, 
      this.step, 
      this.ingredients, 
      this.equipment, 
      this.length,});

  Steps.fromJson(dynamic json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    if (json['equipment'] != null) {
      equipment = [];
      json['equipment'].forEach((v) {
        equipment?.add(Equipment.fromJson(v));
      });
    }
    length = json['length'] != null ? Length.fromJson(json['length']) : null;
  }
  int? number;
  String? step;
  List<Ingredients>? ingredients;
  List<Equipment>? equipment;
  Length? length;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['step'] = step;
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    if (equipment != null) {
      map['equipment'] = equipment?.map((v) => v.toJson()).toList();
    }
    if (length != null) {
      map['length'] = length?.toJson();
    }
    return map;
  }

}

Length lengthFromJson(String str) => Length.fromJson(json.decode(str));
String lengthToJson(Length data) => json.encode(data.toJson());
class Length {
  Length({
      this.number, 
      this.unit,});

  Length.fromJson(dynamic json) {
    number = json['number'];
    unit = json['unit'];
  }
  int? number;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['unit'] = unit;
    return map;
  }

}

Equipment equipmentFromJson(String str) => Equipment.fromJson(json.decode(str));
String equipmentToJson(Equipment data) => json.encode(data.toJson());
class Equipment {
  Equipment({
      this.id, 
      this.name, 
      this.localizedName, 
      this.image,});

  Equipment.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['localizedName'] = localizedName;
    map['image'] = image;
    return map;
  }

}

Ingredients ingredientsFromJson(String str) => Ingredients.fromJson(json.decode(str));
String ingredientsToJson(Ingredients data) => json.encode(data.toJson());
class Ingredients {
  Ingredients({
      this.id, 
      this.name, 
      this.localizedName, 
      this.image,});

  Ingredients.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['localizedName'] = localizedName;
    map['image'] = image;
    return map;
  }

}