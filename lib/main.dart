import 'package:flutter/material.dart';
import 'add_note_view.dart';
import 'note.dart';
import 'note_detail_view.dart';

// Warna-warna yang terinspirasi dari Duolingo
const primaryColor = Color(0xFF58CC02);
const backgroundColor = Color(0xFFF7F7F7);
const textColor = Color(0xFF4B4B4B);

// Menjalankan aplikasi
void main() {
  runApp(const MyNotesApp());
}

// Widget utama aplikasi
class MyNotesApp extends StatelessWidget {
  const MyNotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNotesApp',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

// Halaman utama aplikasi, sekarang menjadi daftar catatan
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar catatan awal
  final List<Note> _notes = [
    Note(title: "Contoh Catatan Pertama", content: "Ini adalah catatan contoh pertama dibuat oleh saya (Miftah Firdaus)"),
    Note(title: "Catatan Buatan Saya", content: "Ini juga catatan buatan saya"),
    Note(title: "Belajar Flutter", content: "Jangan lupa belajar Flutter hari ini!"),
  ];

  // Fungsi untuk menavigasi ke halaman tambah catatan
  void _navigateToAddNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNoteView()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        _notes.add(Note(title: result['title']!, content: result['content']!));
      });
    }
  }

  // Fungsi untuk menavigasi ke halaman detail catatan
  void _navigateToDetailNote(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetailView(note: note)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Notes',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          // Widget custom untuk setiap item catatan
          return _buildNoteCard(note);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNote,
        tooltip: 'Tambah Catatan',
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Widget untuk membuat card catatan yang stylish
  Widget _buildNoteCard(Note note) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () => _navigateToDetailNote(note),
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Ikon untuk dekorasi
              const Icon(Icons.article_outlined, color: primaryColor, size: 28),
              const SizedBox(width: 16.0),
              // Teks catatan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: textColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      note.content,
                      style: const TextStyle(fontSize: 16.0, color: textColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              // Ikon panah
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}