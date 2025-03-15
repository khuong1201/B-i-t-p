import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Profile Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(), // Đẩy nội dung xuống giữa màn hình

          // Hình ảnh
          Image.asset(
            'assets/images/jetpack.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50),

          // Tiêu đề
          Text(
            'Jetpack Compose',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Nội dung mô tả
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),

          // Nút bấm
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const UiComponentsList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(300, 50),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('I`m ready'),
            ),
          ),
        ],
      ),
    );
  }
}
class UiComponentsList extends StatelessWidget {
  const UiComponentsList({super.key});

  final String title = 'UI Components List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(color: Colors.blue,fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //display
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Display',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TextDetail()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF99CCFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Text\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Display Text'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageDetail())
                    );
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF99CCFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Image\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Display an Image'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          //input
          Padding(
            padding: const EdgeInsets.only(left: 16), // Thêm padding bên trái
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Input',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TextFieldDetail())
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF99CCFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Align( // Đảm bảo chữ căn trái
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'TextField\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'InputField for text'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordField()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF99CCFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'PasswordField\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Input field for Password'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          //layout
          Padding(
            padding: const EdgeInsets.only(left: 16), // Thêm padding bên trái
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Layout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> ColumnDetail()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF99CCFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Align( // Đảm bảo chữ căn trái
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Column\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Arranges element vertically'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>RowDetail())
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF99CCFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'row\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Arranges elements horizontally'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class TextDetail extends StatelessWidget {
  const TextDetail({super.key});

  final String title = 'Text Detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white, // Màu nền của container
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 38, color: Colors.black),
                children: [
                  TextSpan(text: 'The '),
                  TextSpan(
                    text: 'quick',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: 'Brown',
                    style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '\nfox j u m p s '),
                  TextSpan(
                    text: 'over',
                    style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '\nthe '),
                  TextSpan(
                    text: 'lazy',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(text: ' dog.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ImageDetail extends StatelessWidget{
  const ImageDetail({super.key});
  final String title= 'Image Detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(fontSize: 20,color: Colors.blue),),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/Mykind.jpg',
          width: 350,
          height: 350,
        ),
      ),
    );
  }
}
class TextFieldDetail extends StatelessWidget{
  const TextFieldDetail({super.key});
  final String title= 'Text Field Detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(fontSize: 20,color: Colors.blue),),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Nhập văn bản...',
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});
  @override
  PasswordFieldState createState() => PasswordFieldState();
}
class PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  final String title = 'Password Field';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(fontSize: 20,color: Colors.blue),),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 300,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: 'Nhập mật khẩu...',
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              suffixIcon: IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ColumnDetail extends StatelessWidget{
  const ColumnDetail({super.key});
  final String title= 'Column Detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(fontSize: 20,color: Colors.blue),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Column (children: [',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[200], // Màu xanh lá cây nhạt
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
            Text(
              '])',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
class RowDetail extends StatelessWidget{
  const RowDetail({super.key});
  final String title= 'Column Detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(fontSize: 20,color: Colors.blue),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Row (children: [',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[300], // Màu xanh dương nhạt
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[500], // Màu xanh dương đậm hơn
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[300], // Màu xanh dương nhạt
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '])',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


