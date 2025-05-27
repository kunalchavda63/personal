import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/core/models/src/note_model.dart';
import 'package:uuid/uuid.dart';

class NotesNotifier extends StateNotifier<List<NoteModel>> {
  NotesNotifier() : super([]);

  final _uuid = Uuid();

  void addNote(String? title, String? desc) {
    final newNote = NoteModel(id: _uuid.v4(), title: title, description: desc);
    state = [...state, newNote];
  }

  void toggleLike(String id, bool? isLiked) {
    state = [
      for (final note in state)
        if (note.id == id)
          note.copyWith(isLiked: !(note.isLiked ?? false))
        else
          note,
    ];
  }

  void remove(String id) {
    state = state.where((note) => note.id != id).toList();
  }

  void addComment() {}

  void updateList(String id, String title, String desc) {
    state = [
      for (final note in state)
        if (note.id == id)
          note.copyWith(title: title, description: desc)
        else
          note,
    ];
  }
}

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteModel>>(
  (ref) => NotesNotifier(),
);

class CommentNotifier extends StateNotifier<List<Comment>> {
  CommentNotifier() : super([]);
}
