import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Application',
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = '0';
  final String _output = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator Application',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Output display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const Divider(color: Colors.grey),

          // Buttons Area
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey[800]!),
                    buildButton("8", Colors.grey[800]!),
                    buildButton("9", Colors.grey[800]!),
                    buildButton("/", Colors.grey[800]!),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey[800]!),
                    buildButton("5", Colors.grey[800]!),
                    buildButton("6", Colors.grey[800]!),
                    buildButton("*", Colors.grey[800]!),
                   
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey[800]!),
                    buildButton("2", Colors.grey[800]!),
                    buildButton("3", Colors.grey[800]!),
                    buildButton("-", Colors.grey[800]!),
                   
                  ],
                ),
                
                Row(
                  children: [
                    buildButton(".", Colors.grey[800]!),
                    buildButton("0", Colors.grey[800]!),
                    buildButton("c", Colors.grey[800]!),
                    buildButton("+", Colors.grey[800]!),
                   
                  ],
                ),
                
                Row(
                  children: [
                    buildButton("=", Colors.green),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
