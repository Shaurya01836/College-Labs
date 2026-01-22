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
      title: 'Basic App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculator')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: (BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 3),
                  borderRadius: BorderRadius.circular(20),
                )),
                alignment: Alignment.center,
                child: const Text(
                  '7',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              const SizedBox(width: 10),

              Container(
                height: 60,
                width: 60,
                decoration: (BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 3),
                  borderRadius: BorderRadius.circular(20),
                )),
                alignment: Alignment.center,
                child: const Text(
                  '8',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              const SizedBox(width: 10),

              Container(
                height: 60,
                width: 60,
                decoration: (BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 3),
                  borderRadius: BorderRadius.circular(20),
                )),
                alignment: Alignment.center,
                child: const Text(
                  '9',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              const SizedBox(width: 10),

              Container(
                height: 60,
                width: 60,
                decoration: (BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 3),
                  borderRadius: BorderRadius.circular(20),
                )),
                alignment: Alignment.center,
                child: const Text(
                  '*',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
