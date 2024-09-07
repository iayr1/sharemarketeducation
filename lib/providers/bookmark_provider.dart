import 'package:flutter/material.dart';
import 'package:edtech_app/models/bookmark.dart';

class BookmarkProvider extends ChangeNotifier {
  Map<String, List<Bookmark>> _bookmarks = {};

  Map<String, List<Bookmark>> get bookmarks => _bookmarks;

  void addBookmark(String courseId, Bookmark bookmark) {
    if (_bookmarks.containsKey(courseId)) {
      _bookmarks[courseId]!.add(bookmark);
    } else {
      _bookmarks[courseId] = [bookmark];
    }
    notifyListeners();
  }

  List<Bookmark> getBookmarks(String courseId) {
    return _bookmarks[courseId] ?? [];
  }

// Add other methods as needed for managing bookmark-related data
}

