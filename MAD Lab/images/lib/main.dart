import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MediaSizeApp());
}

class MediaSizeApp extends StatelessWidget {
  const MediaSizeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaHome(),
    );
  }
}

class MediaHome extends StatefulWidget {
  const MediaHome({super.key});

  @override
  State<MediaHome> createState() => _MediaHomeState();
}

class _MediaHomeState extends State<MediaHome> {
  String _mediaType = '';
  String _sizeCategory = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _processFile(await picked.readAsBytes(), "Image");
    }
  }

  Future<void> _pickVideo() async {
    final XFile? picked = await _picker.pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      _processFile(await picked.readAsBytes(), "Video");
    }
  }

  void _processFile(List<int> bytes, String type) {
    final int sizeInBytes = bytes.length;
    final double sizeInMB = sizeInBytes / (1024 * 1024);

    setState(() {
      _mediaType = type;

      if (sizeInMB < 5) {
        _sizeCategory = "Small (< 5 MB)";
      } else if (sizeInMB <= 20) {
        _sizeCategory = "Medium (5–20 MB)";
      } else {
        _sizeCategory = "Large (> 20 MB)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Size Handler"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Pick Image"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickVideo,
              child: const Text("Pick Video"),
            ),
            const SizedBox(height: 20),
            if (_mediaType.isNotEmpty) ...[
              Text(
                "Media Type: $_mediaType",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Size Category: $_sizeCategory",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}