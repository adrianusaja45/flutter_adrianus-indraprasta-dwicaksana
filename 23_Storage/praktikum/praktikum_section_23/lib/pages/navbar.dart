import 'package:flutter/material.dart';
import 'package:praktikum_section_23/pages/contact_page.dart';

import 'information_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexTerpilih = 0;
  final page = [
    const ContactPage(),
    const SearchPage(),
    const InformationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: page[indexTerpilih],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF6200EE),
          fixedColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information',
            )
          ],
          currentIndex: indexTerpilih,
          onTap: (index) => setState(() => indexTerpilih = index),
        ));
  }
}
