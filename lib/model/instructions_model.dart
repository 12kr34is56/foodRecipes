// class InstructionsModel {
//   final int? stepNumber;
//   final String? stepProcess;
//
//   InstructionsModel({
//     required this.stepNumber,
//     required this.stepProcess,
//   });
//
//   // factory InstructionsModel.fromJson(Map<String, dynamic> json) {
//   //   return InstructionsModel(
//   //     stepNumber: json['steps']['number'],
//   //     stepProcess: json['steps']['step'],
//   //   );
//   // }
//   factory InstructionsModel.fromJson(Map<String, dynamic> json) {
//     // Assuming that "steps" is a list
//     final List<dynamic> steps = json['steps'];
//
//     // Accessing the first element of the list
//     final Map<String, dynamic> firstStep = steps.isNotEmpty ? steps[1] : {};
//
//     return InstructionsModel(
//       stepNumber: firstStep['number'],
//       stepProcess: firstStep['step'],
//     );
//   }
// }

// class InstructionsModel {
//   final List<StepModel>? steps;
//
//   InstructionsModel({required this.steps});
//
//   factory InstructionsModel.fromJson(Map<String, dynamic> json) {
//     final List<dynamic> stepsJson = json['steps'];
//     final List<StepModel> stepsList =
//     stepsJson.map((step) => StepModel.fromJson(step)).toList();
//
//     return InstructionsModel(steps: stepsList);
//   }
// }
//
// class StepModel {
//   final int? stepNumber;
//   final String? stepProcess;
//
//   StepModel({required this.stepNumber, required this.stepProcess});
//
//   factory StepModel.fromJson(Map<String, dynamic> json) {
//     return StepModel(
//       stepNumber: json['number'],
//       stepProcess: json['step'],
//     );
//   }
// }



// class InstructionsModel {
//   List<Recipe> recipes;
//
//   InstructionsModel({required this.recipes});
//
//   factory InstructionsModel.fromJson(List<dynamic> json) {
//     List<Recipe> recipes = json.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();
//     return InstructionsModel(recipes: recipes);
//   }
// }
//
// class Recipe {
//   String name;
//   List<RecipeStep> steps;
//
//   Recipe({required this.name, required this.steps});
//
//   factory Recipe.fromJson(Map<String, dynamic> json) {
//     return Recipe(
//       name: json['name'] ?? '',
//       steps: (json['steps'] as List<dynamic>?)
//           ?.map((step) => RecipeStep.fromJson(step))
//           .toList() ??
//           [],
//     );
//   }
// }
//
// class RecipeStep {
//   int number;
//   String step;
//   List<Ingredient> ingredients;
//   List<Equipment> equipment;
//   Length length;
//
//   RecipeStep({
//     required this.number,
//     required this.step,
//     required this.ingredients,
//     required this.equipment,
//     required this.length,
//   });
//
//   factory RecipeStep.fromJson(Map<String, dynamic> json) {
//     return RecipeStep(
//       number: json['number'] ?? 0,
//       step: json['step'] ?? '',
//       ingredients: (json['ingredients'] as List<dynamic>?)
//           ?.map((ingredient) => Ingredient.fromJson(ingredient))
//           .toList() ??
//           [],
//       equipment: (json['equipment'] as List<dynamic>?)
//           ?.map((equip) => Equipment.fromJson(equip))
//           .toList() ??
//           [],
//       length: Length.fromJson(json['length'] ?? {}),
//     );
//   }
// }
//
// class Ingredient {
//   int id;
//   String name;
//   String localizedName;
//   String image;
//
//   Ingredient({required this.id, required this.name, required this.localizedName, required this.image});
//
//   factory Ingredient.fromJson(Map<String, dynamic> json) {
//     return Ingredient(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       localizedName: json['localizedName'] ?? '',
//       image: json['image'] ?? '',
//     );
//   }
// }
//
// class Equipment {
//   int id;
//   String name;
//   String localizedName;
//   String image;
//
//   Equipment({required this.id, required this.name, required this.localizedName, required this.image});
//
//   factory Equipment.fromJson(Map<String, dynamic> json) {
//     return Equipment(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       localizedName: json['localizedName'] ?? '',
//       image: json['image'] ?? '',
//     );
//   }
// }
//
// class Length {
//   int number;
//   String unit;
//
//   Length({required this.number, required this.unit});
//
//   factory Length.fromJson(Map<String, dynamic> json) {
//     return Length(
//       number: json['number'] ?? 0,
//       unit: json['unit'] ?? '',
//     );
//   }
// }


/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Equipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Equipment({this.id, this.name, this.localizedName, this.image});

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['localizedName'] = localizedName;
    data['image'] = image;
    return data;
  }
}

class Ingredient {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Ingredient({this.id, this.name, this.localizedName, this.image});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['localizedName'] = localizedName;
    data['image'] = image;
    return data;
  }
}

class Length {
  int? number;
  String? unit;

  Length({this.number, this.unit});

  Length.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = number;
    data['unit'] = unit;
    return data;
  }
}

class Root {
  String? name;
  List<Step?>? steps;

  Root({this.name, this.steps});

  Root.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = <Step>[];
      json['steps'].forEach((v) {
        steps!.add(Step.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['steps'] =steps != null ? steps!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Step {
  int? number;
  String? step;
  List<Ingredient?>? ingredients;
  List<Equipment?>? equipment;
  Length? length;

  Step({this.number, this.step, this.ingredients, this.equipment, this.length});

  Step.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredient>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredient.fromJson(v));
      });
    }
    if (json['equipment'] != null) {
      equipment = <Equipment>[];
      json['equipment'].forEach((v) {
        equipment!.add(Equipment.fromJson(v));
      });
    }
    length = json['length'] != null ? Length?.fromJson(json['length']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = number;
    data['step'] = step;
    data['ingredients'] =ingredients != null ? ingredients!.map((v) => v?.toJson()).toList() : null;
    data['equipment'] =equipment != null ? equipment!.map((v) => v?.toJson()).toList() : null;
    data['length'] = length!.toJson();
    return data;
  }
}

