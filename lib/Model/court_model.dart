class CourtModel {
  String title;
  String description;

  CourtModel({
    required this.title,
    required this.description,
  });

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      title: json['title'] as String,
      description: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson(CourtModel instance) {
    return <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
  }
}
