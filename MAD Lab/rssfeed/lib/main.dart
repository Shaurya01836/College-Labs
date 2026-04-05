import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'rss_service.dart';
import 'rss_item.dart';

void main() {
  runApp(const RssApp());
}

class RssApp extends StatelessWidget {
  const RssApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RssHome(),
    );
  }
}

class RssHome extends StatefulWidget {
  const RssHome({super.key});

  @override
  State<RssHome> createState() => _RssHomeState();
}

class _RssHomeState extends State<RssHome> {
  late Future<List<RssItem>> rssFeed;

  @override
  void initState() {
    super.initState();
    rssFeed = RssService.fetchRss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSS Feed Reader'),
      ),
      body: FutureBuilder<List<RssItem>>(
        future: rssFeed,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading RSS Feed'),
            );
          } 
          else {
            final items = snapshot.data!;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(items[index].title),
                    subtitle: Text(items[index].pubDate),
                    onTap: () async {
                      final url = Uri.parse(items[index].link);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}