import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:flutter_application_1/insta.dart';

class Bottom extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  Bottom({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Bottom> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _updatePages();
  }

  @override
  void didUpdateWidget(Bottom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.name != oldWidget.name ||
        widget.phoneNumber != oldWidget.phoneNumber ||
        widget.email != oldWidget.email ||
        widget.country != oldWidget.country) {
      _updatePages();
    }
  }

  void _updatePages() {
    _pages = [
      HomePage(),
      Insta(),
      SecondUser(
        name: widget.name,
        phoneNumber: widget.phoneNumber,
        country: widget.country,
        email: widget.email,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(''),
    );
  }
}

class SecondUser extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  SecondUser({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.nam.tr()),
            Text('$name', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            Text(LocaleKeys.phon.tr()),
            Text('$phoneNumber', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            Text(LocaleKeys.ma.tr()),
            Text('$email', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            Text(LocaleKeys.coun.tr()),
            Text('$country', style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
