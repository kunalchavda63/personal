class NoteModel {
  final String id;
  final String? title;
  final String? description;
  NoteModel({required this.id, required this.title, required this.description});

  NoteModel copyWith({String? title, String? description}) {
    return NoteModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
