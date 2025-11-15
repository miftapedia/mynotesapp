import 'package:flutter/material.dart';
import 'note.dart';

// Halaman untuk menampilkan detail satu catatan
class NoteDetailView extends StatelessWidget {
  final Note note;

  const NoteDetailView({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Warna-warna yang terinspirasi dari Duolingo
    const primaryColor = Color(0xFF58CC02);
    const backgroundColor = Color(0xFFF7F7F7);
    const textColor = Color(0xFF4B4B4B);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          note.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card untuk menampilkan catatan
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    note.content,
                    style: const TextStyle(fontSize: 18.0, color: textColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}