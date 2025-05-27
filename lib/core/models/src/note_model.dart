class NoteModel {
  final String id;
  final String? title;
  final String? description;
  bool? isLiked;
  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    this.isLiked = false,
  });

  NoteModel copyWith({String? title, String? description, bool? isLiked}) {
    return NoteModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isLiked: isLiked ?? false,
    );
  }
}
