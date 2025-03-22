class History {
  final String wasteTypes;
  final String estimateWeight;
  final String status;
  final DateTime datePickup;
  final DateTime createdAt;

  History({
    required this.wasteTypes,
    required this.estimateWeight,
    required this.status,
    required this.datePickup,
    required this.createdAt,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      wasteTypes:
          json['wasteTypes'] is List
              ? (json['wasteTypes'] as List).join(', ')
              : json['wasteTypes'] ?? '',
      estimateWeight: json['estimateWeight']?.toString() ?? '',
      status: json['status'] ?? '',
      datePickup:
          json['datePickup'] != null
              ? DateTime.tryParse(json['datePickup']) ?? DateTime.now()
              : DateTime.now(),
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt']) ?? DateTime.now()
              : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wasteTypes': wasteTypes,
      'estimateWeight': estimateWeight,
      'status': status,
      'datePickup': datePickup.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
