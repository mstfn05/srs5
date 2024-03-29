import 'package:flutter/material.dart';

class News {
  String title;
  String content;

  News(this.title, this.content);
}

class Insta extends StatelessWidget {
  final List<News> sportsNews = [
    News('Футбол: Команда Барселоны побеждает команду Реал Мадрида',
        'В захватывающем матче команда сине-гранатовых выиграла у команды сливочных со счетом 3:2.'),
    News('Баскетбол: Рекордное количество очков за игру',
        'Игрок команды Chicago Bulls установил новый рекорд, набрав 50 очков за одну игру.'),
    News('Теннис: Турнирная победа для Рыбаковой',
        'Рыбакова становится чемпионом теннисного турнира после захватывающего финала.'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            for (var news in sportsNews)
              Expanded(
                child: NewsCard(news: news),
              ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  final News news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  int likes = 0;
  int dislikes = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.news.title),
            subtitle: Text(widget.news.content),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: isLiked ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    likes++;
                    isLiked = !isLiked;
                  });
                },
              ),
              Text('$likes'),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {
                  setState(() {
                    dislikes++;
                  });
                },
              ),
              Text('$dislikes'),
            ],
          ),
        ],
      ),
    );
  }
}
