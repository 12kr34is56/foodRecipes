class AmountConversion {
  double? sourceAmount;
  String? sourceUnit;
  double? targetAmount;
  String? targetUnit;
  String? answer;
  String? type;

  AmountConversion(
      {this.sourceAmount,
        this.sourceUnit,
        this.targetAmount,
        this.targetUnit,
        this.answer,
        this.type});

  AmountConversion.fromJson(Map<String, dynamic> json) {
    sourceAmount = json['sourceAmount'];
    sourceUnit = json['sourceUnit'];
    targetAmount = json['targetAmount'];
    targetUnit = json['targetUnit'];
    answer = json['answer'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceAmount'] = this.sourceAmount;
    data['sourceUnit'] = this.sourceUnit;
    data['targetAmount'] = this.targetAmount;
    data['targetUnit'] = this.targetUnit;
    data['answer'] = this.answer;
    data['type'] = this.type;
    return data;
  }
}
