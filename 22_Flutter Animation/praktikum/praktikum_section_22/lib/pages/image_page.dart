import 'package:flutter/material.dart';
import 'package:praktikum_section_22/pages/gallery_page.dart';
import 'package:praktikum_section_22/provider/all_image.dart';
import 'package:provider/provider.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final parameter =
        ModalRoute.of(context)!.settings.arguments as ImageProvider;

    return WillPopScope(
        onWillPop: () async {
          await Navigator.of(context).pushAndRemoveUntil<dynamic>(
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const GalleryPage(),
              transitionsBuilder: (context, animation1, animation2, child) {
                return FadeTransition(
                  opacity: animation1,
                  child: child,
                );
              },
            ),
            (route) => true,
          );
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: parameter),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back to Gallery'),
            )
          ],
        ));
  }
}
