import 'package:flutter/material.dart';
import 'package:praktikum_section_23/pages/login_page.dart';
import 'package:praktikum_section_23/pages/update_contact_page.dart';
import 'package:praktikum_section_23/widget/custom_page_route.dart';
import 'pages/gallery_page.dart';
import 'pages/image_page.dart';

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
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: const Color(0xFF6200EE),
            secondary: const Color(0xFF03DAC5)),
      ),
      home: const Scaffold(
        body: LoginPage(),
      ),
      onGenerateRoute: (route) => onGenerateRoute(route),
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/updateContact') {
      return CustomPageRoute(
          child: const UpdateContactPage(), settings: settings);
    } else if (settings.name == '/gallery') {
      return CustomPageRoute(child: const GalleryPage(), settings: settings);
    } else if (settings.name == '/imageView') {
      return CustomPageRoute(child: const ImagePage(), settings: settings);
    }
    return null;
  }
}
