class SentAna {
  SentAna({
    required this.emotions,
  });

  final String emotions;

  factory SentAna.fromJson(Map<String, dynamic> json) {
    return SentAna(
      emotions: json['emotions_detected'].isEmpty
          ? 'not found'
          : json['emotions_detected'][0],
    );
  }
}
