import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_section_21/bloc/contact_bloc.dart';
import 'pages/gallery_page.dart';
import 'pages/image_page.dart';
import 'pages/information_page.dart';
import 'pages/material_page.dart';
import 'pages/search_page.dart';

//Soal Prioritas 1
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       theme: ThemeData.dark(),
//       home: const HomePage(),
//     );
//   }
// }

// Soal Eksplorasi

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int indexTerpilih = 0;
  final page = [
    const HomePage(),
    const SearchPage(),
    const InformationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
                primary: const Color(0xFF6200EE),
                secondary: const Color(0xFF03DAC5)),
          ),
          home: Scaffold(
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
              )),
          routes: {
            '/gallery': (_) => const GalleryPage(),
            '/imageView': (_) => const ImagePage()
          }),
    );
  }
}
