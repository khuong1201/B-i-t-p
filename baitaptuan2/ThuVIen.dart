import 'package:flutter/material.dart';

void main() {
  runApp(const LibraryManagementApp());
}

class LibraryManagementApp extends StatelessWidget {
  const LibraryManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QL Thư viện',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const LibraryHomePage(),
    );
  }
}

class LibraryHomePage extends StatefulWidget {
  const LibraryHomePage({Key? key}) : super(key: key);

  @override
  State<LibraryHomePage> createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  final TextEditingController _employeeController =
  TextEditingController(text: "Nguyen Van A");

  final List<String> books = ["Sách 01", "Sách 02"];
  final TextEditingController _bookController = TextEditingController();

  // Use a Set to store selected books
  Set<String> _selectedBooks = {};

  void _addBook() {
    if (_bookController.text.isNotEmpty) {
      setState(() {
        books.add(_bookController.text);
        _bookController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('He Thong Quản lý Thư viện'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nhân viên',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _employeeController,
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1976D2)),
                  child: const Text('Đổi'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Danh sách sách
            const Text(
              'Danh sách sách',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final bookName = books[index];
                  return BookListItem(
                    bookName: bookName,
                    isSelected: _selectedBooks.contains(bookName),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _selectedBooks.add(bookName);
                        } else {
                          _selectedBooks.remove(bookName);
                        }
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // Nút thêm sách (đặt dưới danh sách)
            ElevatedButton(
              onPressed: _addBook,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2), // Same blue as "Đổi" button
              ),
              child: const Text('Thêm'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quản lý',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'DS Sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Nhân viên',
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị danh sách sách
class BookListItem extends StatelessWidget {
  const BookListItem({Key? key, required this.bookName, required this.isSelected, required this.onChanged}) : super(key: key);

  final String bookName;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // More rounded corners
      ),
      elevation: 1, // Reduced elevation
      child: CheckboxListTile(
        title: Text(bookName, style: const TextStyle(fontSize: 16)),
        value: isSelected,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}