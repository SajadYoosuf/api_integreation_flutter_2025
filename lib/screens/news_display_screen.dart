import 'package:flutter/material.dart';

import '../services/news_services.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var newslist;
  bool isloading = true;

  void initState() {
    super.initState();
    _initLoad();
  }

  Future fetchNews() async {
    final fetchedArticles = await NewsServices.fetchNews();
    setState(() {
      newslist = fetchedArticles;
      isloading = false;
    });
  }

  Future _initLoad() async {
    Future.wait([fetchNews()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Today News')),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newslist.length,
              itemBuilder: (context, index) {
                final item = newslist[index];
                return ListTile(
                  title: Text(item["title"] ?? 'No Title'),
                  subtitle: Text(item['description'] ?? ''),
                );
              },
            ),
    );
  }
}
