
import 'package:flutter/material.dart';
import '../pages/Search.dart';
import '../pages/home.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
  ];


  int _item = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _item,
        onTap: (value) {
          setState(() {
            _item=value;
          });          
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search"),
                   
      ],
      ),

      body: pages[_item],
    );
  }

}
