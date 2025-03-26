class Points {
  final String totalPoints;
  final String cashEquivalent;

  Points({
    required this.totalPoints,
    required this.cashEquivalent,
  });

  factory Points.fromJson(Map<String, dynamic> json) {
    return Points(
      totalPoints: json['totalPoints'].toString(), 
      cashEquivalent: json['cashEquivalent'].toString(), // Convert int to String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPoints': totalPoints,
      'cashEquivalent': cashEquivalent,
    };
  }
}