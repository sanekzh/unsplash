class Pictures {
  final String id;
  final String description;
  final String altDescription;
  final String fullPic;
  final String smallPic;
  final String autor;

  Pictures({
    this.id,
    this.description,
    this.altDescription,
    this.fullPic,
    this.smallPic,
    this.autor
  });

  factory Pictures.fromJson(Map<String, dynamic> json) {
    return Pictures(
      id: json['id'] as String,
      description: json['description'] as String,
      altDescription: json['alt_description'] as String,
      fullPic: json['urls']['full'] as String,
      smallPic: json['urls']['small'] as String,
      autor: json['user']['name'] as String,
    );
  }
}
