class NoteModel {
  final String id;
  final String? title;
  final String? description;
  final List<Comment>? listComment;
  bool? isLiked;
  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    this.isLiked = false,
    this.listComment,
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

class Comment {
  final String id;
  final String? title;
  final String? description;
  bool? isLiked;
  Comment({
    required this.id,
    required this.title,
    required this.description,
    this.isLiked = false,
  });

  Comment copyWith({String? title, String? description, bool? isLiked}) {
    return Comment(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isLiked: isLiked ?? false,
    );
  }
}
