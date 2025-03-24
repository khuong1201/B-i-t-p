import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/jetpack.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              "Navigation",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "is a framework that simplifies the implementation of navigation between different UI components (activities, fragments, or composables) in an app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListViewScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(300, 40),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "PUSH",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
          ),
        ),
        title: const Text(
          'LazyColumn',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1000000,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.lightBlueAccent.withOpacity(0.2),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              title: Text("${index + 1} | The only way to do great work is to love what you do"),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(index: index + 1)),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;
  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
          ),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Text(
              '"The only way to do great work\n is to love what you do"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),SizedBox(height: 30,),
          Container(
            width: 296,
            height: 444,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  '"The only\n way to do\ngreat work\n is to love\n what you\n do."',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Steve Jobs',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30,),
                Text(
                  'http://quotes.thisgrandpablogs.com/',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            )
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 40),
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "BACK TO ROOT",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

