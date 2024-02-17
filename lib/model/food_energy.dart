class FoodEnergy {
  Calories? calories;
  Calories? carbs;
  Calories? fat;
  Calories? protein;
  int? recipesUsed;

  FoodEnergy(
      {this.calories, this.carbs, this.fat, this.protein, this.recipesUsed});

  FoodEnergy.fromJson(Map<String, dynamic> json) {
    calories = json['calories'] != null
        ? new Calories.fromJson(json['calories'])
        : null;
    carbs = json['carbs'] != null ? new Calories.fromJson(json['carbs']) : null;
    fat = json['fat'] != null ? new Calories.fromJson(json['fat']) : null;
    protein =
    json['protein'] != null ? new Calories.fromJson(json['protein']) : null;
    recipesUsed = json['recipesUsed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calories != null) {
      data['calories'] = this.calories!.toJson();
    }
    if (this.carbs != null) {
      data['carbs'] = this.carbs!.toJson();
    }
    if (this.fat != null) {
      data['fat'] = this.fat!.toJson();
    }
    if (this.protein != null) {
      data['protein'] = this.protein!.toJson();
    }
    data['recipesUsed'] = this.recipesUsed;
    return data;
  }
}

class Calories {
  ConfidenceRange95Percent? confidenceRange95Percent;
  double? standardDeviation;
  String? unit;
  double? value;

  Calories(
      {this.confidenceRange95Percent,
        this.standardDeviation,
        this.unit,
        this.value});

  Calories.fromJson(Map<String, dynamic> json) {
    confidenceRange95Percent = json['confidenceRange95Percent'] != null
        ? new ConfidenceRange95Percent.fromJson(
        json['confidenceRange95Percent'])
        : null;
    standardDeviation = json['standardDeviation'];
    unit = json['unit'];
    value = json['value'] ?? "N/A";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.confidenceRange95Percent != null) {
      data['confidenceRange95Percent'] =
          this.confidenceRange95Percent!.toJson();
    }
    data['standardDeviation'] = this.standardDeviation;
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}

class ConfidenceRange95Percent {
  double? max;
  double? min;

  ConfidenceRange95Percent({this.max, this.min});

  ConfidenceRange95Percent.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['min'] = this.min;
    return data;
  }
}
