main fest

<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"
    android:maxSdkVersion="28"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>  

pubsec.yaml

path_provider: ^2.1.2
  permission_handler: ^11.3.0

main.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  String _savedData = "";
  String _filePath = "";

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage permission is required to save data.'))
        );
    }
  }

  Future<String?> get _localPath async {
    try {
        final directory = await getExternalStorageDirectory();
        return directory?.path;
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not get directory: $e'))
        );
        return null;
    }
  }

  Future<File?> get _localFile async {
    final path = await _localPath;
    if (path == null) {
        return null;
    }
    _filePath = '$path/my_data.txt';
    return File(_filePath);
  }

  Future<void> _writeData() async {
    final file = await _localFile;
    if (file == null) return;

    try {
        await file.writeAsString(_textController.text);
        _textController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved to $_filePath')),
        );
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save data: $e')),
        );
    }
  }

  Future<void> _readData() async {
    final file = await _localFile;
    if (file == null) {
        setState(() => _savedData = "Could not access file path.");
        return;
    }

    try {
      if (await file.exists()) {
        final contents = await file.readAsString();
        setState(() => _savedData = contents);
      } else {
        setState(() => _savedData = "File not found. Save some data first.");
      }
    } catch (e) {
      setState(() => _savedData = "Error reading file: $e");
    }
  }

  Future<void> _deleteData() async {
    final file = await _localFile;
    if (file == null) return;

    try {
      if (await file.exists()) {
        await file.delete();
        setState(() => _savedData = "");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data deleted successfully.')),
        );
      } else {
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No data to delete.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting data: $e')),
        );
    }
  }

  void _clearInput() {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'SD Card Storage',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Enter data',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _writeData,
                    icon: const Icon(Icons.save_alt),
                    label: const Text('Save'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _clearInput,
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear'),
                     style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _readData,
                icon: const Icon(Icons.file_download),
                label: const Text('Load Data'),
              ),
              const SizedBox(height: 24),
              Text(
                'Saved Data:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Text(_savedData.isEmpty ? "No data loaded." : _savedData, style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 8),
                ElevatedButton.icon(
                    onPressed: _deleteData,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete Data'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
