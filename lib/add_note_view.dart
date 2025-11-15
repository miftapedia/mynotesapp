import 'package:flutter/material.dart';

// Halaman untuk menambah catatan baru
class AddNoteView extends StatefulWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  _AddNoteViewState createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  // Controller untuk mengelola input dari TextField
  final TextEditingController _noteController = TextEditingController();

  // Fungsi untuk menyimpan catatan
  void _saveNote() {
    final String noteText = _noteController.text;

    if (noteText.isNotEmpty) {
      Navigator.pop(context, noteText);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Catatan tidak boleh kosong!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Warna-warna yang terinspirasi dari Duolingo
    const primaryColor = Color(0xFF58CC02);
    const backgroundColor = Color(0xFFF7F7F7);
    const textColor = Color(0xFF4B4B4B);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Tambah Catatan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField untuk mengisi catatan
            TextField(
              controller: _noteController,
              autofocus: true,
              style: const TextStyle(color: textColor, fontSize: 16.0),
              decoration: InputDecoration(
                hintText: 'Tulis catatan Anda di sini...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: primaryColor,
                    width: 2.0,
                  ),
                ),
              ),
              maxLines: 8, // Lebih banyak ruang untuk menulis
            ),
            const SizedBox(height: 24.0),

            // Tombol untuk menyimpan
            ElevatedButton(
              onPressed: _saveNote,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 5.0,
              ),
              child: const Text(
                'Simpan Catatan',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}