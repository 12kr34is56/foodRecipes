import 'dart:convert';
FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));
String foodModelToJson(FoodModel data) => json.encode(data.toJson());
class FoodModel {
  FoodModel({
      this.results, 
      this.offset, 
      this.number, 
      this.totalResults,});

  FoodModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }
  List<Results>? results;
  int? offset;
  int? number;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['offset'] = offset;
    map['number'] = number;
    map['totalResults'] = totalResults;
    return map;
  }

}

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());
class Results {
  Results({
      this.vegetarian, 
      this.vegan, 
      this.glutenFree, 
      this.dairyFree, 
      this.veryHealthy, 
      this.cheap, 
      this.veryPopular, 
      this.sustainable, 
      this.lowFodmap, 
      this.weightWatcherSmartPoints, 
      this.gaps, 
      this.preparationMinutes, 
      this.cookingMinutes, 
      this.aggregateLikes, 
      this.healthScore, 
      this.creditsText, 
      this.sourceName, 
      this.pricePerServing, 
      this.id, 
      this.title, 
      this.readyInMinutes, 
      this.servings, 
      this.sourceUrl, 
      this.image, 
      this.imageType, 
      this.nutrition, 
      this.summary, 
      this.cuisines,
      this.analyzedInstructions, 
      this.spoonacularScore, 
      this.spoonacularSourceUrl,});

  Results.fromJson(dynamic json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    lowFodmap = json['lowFodmap'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    aggregateLikes = json['aggregateLikes'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    nutrition = json['nutrition'] != null ? Nutrition.fromJson(json['nutrition']) : null;
    summary = json['summary'];
    if (json['analyzedInstructions'] != null) {
      analyzedInstructions = [];
      json['analyzedInstructions'].forEach((v) {
        analyzedInstructions?.add(AnalyzedInstructions.fromJson(v));
      });
    }
    spoonacularScore = json['spoonacularScore'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? sourceName;
  double? pricePerServing;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  Nutrition? nutrition;
  String? summary;
  List<dynamic>? cuisines;
  List<AnalyzedInstructions>? analyzedInstructions;
  double? spoonacularScore;
  String? spoonacularSourceUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vegetarian'] = vegetarian;
    map['vegan'] = vegan;
    map['glutenFree'] = glutenFree;
    map['dairyFree'] = dairyFree;
    map['veryHealthy'] = veryHealthy;
    map['cheap'] = cheap;
    map['veryPopular'] = veryPopular;
    map['sustainable'] = sustainable;
    map['lowFodmap'] = lowFodmap;
    map['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    map['gaps'] = gaps;
    map['preparationMinutes'] = preparationMinutes;
    map['cookingMinutes'] = cookingMinutes;
    map['aggregateLikes'] = aggregateLikes;
    map['healthScore'] = healthScore;
    map['creditsText'] = creditsText;
    map['sourceName'] = sourceName;
    map['pricePerServing'] = pricePerServing;
    map['id'] = id;
    map['title'] = title;
    map['readyInMinutes'] = readyInMinutes;
    map['servings'] = servings;
    map['sourceUrl'] = sourceUrl;
    map['image'] = image;
    map['imageType'] = imageType;
    if (nutrition != null) {
      map['nutrition'] = nutrition?.toJson();
    }
    map['summary'] = summary;
    if (cuisines != null) {
      map['cuisines'] = cuisines?.map((v) => v.toJson()).toList();
    }
    if (analyzedInstructions != null) {
      map['analyzedInstructions'] = analyzedInstructions?.map((v) => v.toJson()).toList();
    }
    map['spoonacularScore'] = spoonacularScore;
    map['spoonacularSourceUrl'] = spoonacularSourceUrl;
    return map;
  }

}

AnalyzedInstructions analyzedInstructionsFromJson(String str) => AnalyzedInstructions.fromJson(json.decode(str));
String analyzedInstructionsToJson(AnalyzedInstructions data) => json.encode(data.toJson());
class AnalyzedInstructions {
  AnalyzedInstructions({
      this.name, 
      this.steps,});

  AnalyzedInstructions.fromJson(dynamic json) {
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
      this.equipment,});

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
  }
  int? number;
  String? step;
  List<Ingredients>? ingredients;
  List<Equipment>? equipment;

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

Nutrition nutritionFromJson(String str) => Nutrition.fromJson(json.decode(str));
String nutritionToJson(Nutrition data) => json.encode(data.toJson());
class Nutrition {
  Nutrition({
      this.nutrients, 
      this.properties, 
      this.flavonoids, 
      this.ingredients, 
      this.caloricBreakdown, 
      this.weightPerServing,});

  Nutrition.fromJson(dynamic json) {
    if (json['nutrients'] != null) {
      nutrients = [];
      json['nutrients'].forEach((v) {
        nutrients?.add(Nutrients.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = [];
      json['properties'].forEach((v) {
        properties?.add(Properties.fromJson(v));
      });
    }
    if (json['flavonoids'] != null) {
      flavonoids = [];
      json['flavonoids'].forEach((v) {
        flavonoids?.add(Flavonoids.fromJson(v));
      });
    }
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    caloricBreakdown = json['caloricBreakdown'] != null ? CaloricBreakdown.fromJson(json['caloricBreakdown']) : null;
    weightPerServing = json['weightPerServing'] != null ? WeightPerServing.fromJson(json['weightPerServing']) : null;
  }
  List<Nutrients>? nutrients;
  List<Properties>? properties;
  List<Flavonoids>? flavonoids;
  List<Ingredients>? ingredients;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (nutrients != null) {
      map['nutrients'] = nutrients?.map((v) => v.toJson()).toList();
    }
    if (properties != null) {
      map['properties'] = properties?.map((v) => v.toJson()).toList();
    }
    if (flavonoids != null) {
      map['flavonoids'] = flavonoids?.map((v) => v.toJson()).toList();
    }
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    if (caloricBreakdown != null) {
      map['caloricBreakdown'] = caloricBreakdown?.toJson();
    }
    if (weightPerServing != null) {
      map['weightPerServing'] = weightPerServing?.toJson();
    }
    return map;
  }

}

WeightPerServing weightPerServingFromJson(String str) => WeightPerServing.fromJson(json.decode(str));
String weightPerServingToJson(WeightPerServing data) => json.encode(data.toJson());
class WeightPerServing {
  WeightPerServing({
      this.amount, 
      this.unit,});

  WeightPerServing.fromJson(dynamic json) {
    amount = json['amount'];
    unit = json['unit'];
  }
  int? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }

}

CaloricBreakdown caloricBreakdownFromJson(String str) => CaloricBreakdown.fromJson(json.decode(str));
String caloricBreakdownToJson(CaloricBreakdown data) => json.encode(data.toJson());
class CaloricBreakdown {
  CaloricBreakdown({
      this.percentProtein, 
      this.percentFat, 
      this.percentCarbs,});

  CaloricBreakdown.fromJson(dynamic json) {
    percentProtein = json['percentProtein'];
    percentFat = json['percentFat'];
    percentCarbs = json['percentCarbs'];
  }
  double? percentProtein;
  double? percentFat;
  double? percentCarbs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['percentProtein'] = percentProtein;
    map['percentFat'] = percentFat;
    map['percentCarbs'] = percentCarbs;
    return map;
  }

}

Ingredients ingredientsFromJsons(String str) => Ingredients.fromJson(json.decode(str));
String ingredientsToJsons(Ingredients data) => json.encode(data.toJson());
class Ingredientss {
  Ingredientss({
      this.id, 
      this.name, 
      this.amount, 
      this.unit, 
      this.nutrients,});

  Ingredientss.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    if (json['nutrients'] != null) {
      nutrients = [];
      json['nutrients'].forEach((v) {
        nutrients?.add(Nutrients.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  double? amount;
  String? unit;
  List<Nutrients>? nutrients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    if (nutrients != null) {
      map['nutrients'] = nutrients?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Nutrients nutrientsFromJson(String str) => Nutrients.fromJson(json.decode(str));
String nutrientsToJson(Nutrients data) => json.encode(data.toJson());
class Nutrients {
  Nutrients({
      this.name, 
      this.amount, 
      this.unit, 
      this.percentOfDailyNeeds,});

  Nutrients.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    map['percentOfDailyNeeds'] = percentOfDailyNeeds;
    return map;
  }

}

Flavonoids flavonoidsFromJson(String str) => Flavonoids.fromJson(json.decode(str));
String flavonoidsToJson(Flavonoids data) => json.encode(data.toJson());
class Flavonoids {
  Flavonoids({
      this.name, 
      this.amount, 
      this.unit,});

  Flavonoids.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }
  String? name;
  double? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }

}

Properties propertiesFromJson(String str) => Properties.fromJson(json.decode(str));
String propertiesToJson(Properties data) => json.encode(data.toJson());
class Properties {
  Properties({
      this.name, 
      this.amount, 
      this.unit,});

  Properties.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }
  String? name;
  double? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }

}

Nutrients nutrientsFromJsons(String str) => Nutrients.fromJson(json.decode(str));
String nutrientsToJsons(Nutrients data) => json.encode(data.toJson());
class Nutrientss {
  Nutrientss({
      this.name, 
      this.amount, 
      this.unit, 
      this.percentOfDailyNeeds,});

  Nutrientss.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    map['percentOfDailyNeeds'] = percentOfDailyNeeds;
    return map;
  }

}