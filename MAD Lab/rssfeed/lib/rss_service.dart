import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'rss_item.dart';

class RssService {
  static const String _rssFeedUrl = 'https://feeds.bbci.co.uk/news/rss.xml';

  static const String _corsProxy = 'https://corsproxy.io/?url=';

  static Future<List<RssItem>> fetchRss() async {
    final url = kIsWeb
        ? Uri.parse('$_corsProxy${Uri.encodeComponent(_rssFeedUrl)}')
        : Uri.parse(_rssFeedUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final document = XmlDocument.parse(response.body);
      final items = document.findAllElements('item');

      return items.map((item) {
  String getText(String tag) {
    final element = item.getElement(tag);
    return element?.innerText.trim() ?? '';
  }

  return RssItem(
    title: getText('title'),
    description: getText('description'),
    link: getText('link'),
    pubDate: getText('pubDate'),
  );
}).toList();
    
    } else {
      throw Exception('Failed to load RSS Feed');
    }
  }
}
