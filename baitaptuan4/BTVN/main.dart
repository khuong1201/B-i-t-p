import 'view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/task_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: MaterialApp(
        title: 'TaskUth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>((
                Set<MaterialState> states,
                ) {
              if (states.contains(MaterialState.selected)) {
                return Colors.blue;
              }
              return Colors.grey.shade300;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
