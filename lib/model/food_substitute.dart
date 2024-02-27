class FoodSubstitute {
  String? status;
  String? ingredient;
  List<String>? substitutes;
  String? message;

  FoodSubstitute(
      {this.status, this.ingredient, this.substitutes, this.message});

  FoodSubstitute.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    ingredient = json['ingredient'];
    substitutes = json['substitutes']?.cast<String>() ?? [];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ingredient'] = this.ingredient;
    data['substitutes'] = this.substitutes;
    data['message'] = this.message;
    return data;
  }
}
