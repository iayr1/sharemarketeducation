import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edtech_app/models/bookmark.dart';

class BookmarkService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a bookmark for a specific course
  Future<void> addBookmark(String courseId, Bookmark bookmark) async {
    try {
      await _firestore
          .collection('bookmarks')
          .doc(courseId)
          .collection('userBookmarks')
          .add(bookmark.toJson());
    } catch (e) {
      print("Error adding bookmark: $e");
    }
  }

  // Get all bookmarks for a specific course
  Future<List<Bookmark>> getBookmarks(String courseId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('bookmarks')
          .doc(courseId)
          .collection('userBookmarks')
          .get();
      List<Bookmark> bookmarks = querySnapshot.docs.map((doc) {
        return Bookmark.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return bookmarks;
    } catch (e) {
      print("Error getting bookmarks: $e");
      return [];
    }
  }

  // Remove a bookmark for a specific course
  Future<void> removeBookmark(String courseId, String bookmarkId) async {
    try {
      await _firestore
          .collection('bookmarks')
          .doc(courseId)
          .collection('userBookmarks')
          .doc(bookmarkId)
          .delete();
    } catch (e) {
      print("Error removing bookmark: $e");
    }
  }
}
