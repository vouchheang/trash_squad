class Schedule {
  final String wasteTypes;
  final String estimateWeight;
  final String? token;
  final String date;

  Schedule({
    required this.wasteTypes,
    required this.estimateWeight,
    required this.token,
    required this.date,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      wasteTypes:
          json['wasteTypes'] is List
              ? (json['wasteTypes'] as List).join(', ')
              : json['wasteTypes'] ?? '',
      estimateWeight: json['estimateWeight']?.toString() ?? '',
      token : json['token'],
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wasteTypes': wasteTypes,
      'estimateWeight': estimateWeight,
      'token' : token,
      'date': date,
    };
  }
}
