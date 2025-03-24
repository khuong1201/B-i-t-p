import 'package:flutter/material.dart';
import 'home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Onboarding',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 3) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void skipToLastPage() {
    controller.animateToPage(
      3,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: const [
                    WelcomePage(
                      imagePath: 'assets/images/uth.png',
                      title: 'UTH SmartTasks',
                      description: '',
                    ),
                    WelcomePage(
                      imagePath: 'assets/images/timeManager.png',
                      title: 'Easy Time Management',
                      description: 'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first.',
                    ),
                    WelcomePage(
                      imagePath: 'assets/images/teamwork.png',
                      title: 'Increase Work Effectiveness',
                      description: 'Time management and the determination of more important tasks will give your job statistics better and always improve.',
                    ),
                    WelcomePage(
                      imagePath: 'assets/images/ReminderNotification.png',
                      title: 'Reminder Notification',
                      description: 'The advantage of this application is that it also provides reminders for you so you don`t forget to keep doing your assignments well and according to the time you have set.',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: currentIndex == 1
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    // Nút "Back" (Chỉ hiện từ trang 2 trở đi)
                    if (currentIndex >= 2)
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: previousPage,
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      )
                    else if (currentIndex > 1)
                      const SizedBox(width: 50),

                    // Nút "Next" (Ẩn ở trang đầu)
                    if (currentIndex > 0)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 50),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (currentIndex == 3) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          } else {
                            nextPage();
                          }
                        },
                        child: Text(
                          currentIndex ==  3 ? "Get Started" : "Next",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),

          // Nút "Skip" (Chỉ hiện ở trang 2 tro di)
          if (currentIndex >0)
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: skipToLastPage,
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),

          // Chấm tròn chỉ báo trang (Ẩn trang đầu)
          if (currentIndex >= 1)
            Positioned(
              top: 50,
              left: 20,
              child: Row(
                children: List.generate(4, (index) {
                  if (index == 0) return const SizedBox();
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: currentIndex == index ? 12 : 8,
                    height: currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const WelcomePage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    bool isFirstPage = description.isEmpty;

    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 200, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isFirstPage ? Colors.blue : Colors.black,
            ),
          ),
          if (!isFirstPage) ...[
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }
}