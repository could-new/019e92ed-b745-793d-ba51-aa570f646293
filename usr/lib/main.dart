import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LearningScreen(),
      },
    );
  }
}

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  // A list of coding concepts we want to show
  final List<String> _codingTips = [
    "Welcome to Coding! Tap 'Next Tip' to start.",
    "Variable: A box where you store data (like a name or a score).",
    "String: Text data, usually wrapped in quotes like 'Hello'.",
    "Integer: A whole number, like 42 or 7.",
    "Boolean: A true or false value.",
    "Function: A reusable block of code that does a specific task.",
    "Loop: A way to run the same code multiple times.",
    "If-Statement: A way to make decisions in code.",
    "Widget: The building blocks of a Flutter app's user interface.",
    "State: Data that can change over time in your app.",
  ];

  int _currentIndex = 0;

  // This function changes the state to show the next tip
  void _showNextTip() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _codingTips.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coding Basics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.computer,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Text(
                  _codingTips[_currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _showNextTip,
                icon: const Icon(Icons.lightbulb_outline),
                label: const Text(
                  'Next Tip',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
