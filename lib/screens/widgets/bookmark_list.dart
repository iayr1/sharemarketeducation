import 'package:flutter/material.dart';
import 'package:edtech_app/models/bookmark.dart';

class BookmarkListWidget extends StatelessWidget {
  final List<Bookmark> bookmarks;

  BookmarkListWidget({required this.bookmarks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Bookmarks',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            var bookmark = bookmarks[index];
            return ListTile(
              title: Text('Bookmark at ${bookmark.timestamp} seconds'),
              subtitle: Text(bookmark.description),
            );
          },
        ),
      ],
    );
  }
}
