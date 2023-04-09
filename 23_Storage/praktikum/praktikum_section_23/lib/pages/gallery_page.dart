import 'package:flutter/material.dart';
import 'package:praktikum_section_23/pages/navbar.dart';
import 'package:praktikum_section_23/provider/all_image.dart' as images;
import 'package:provider/provider.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<images.Images>(context);

    return WillPopScope(
        onWillPop: () async {
          await Navigator.of(context).pushAndRemoveUntil<dynamic>(
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const HomePage(),
              transitionsBuilder: (context, animation1, animation2, child) {
                return FadeTransition(
                  opacity: animation1,
                  child: child,
                );
              },
            ),
            (route) => false,
          );
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Gallery Page'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                  itemCount: imageProvider.images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                                padding: const EdgeInsets.all(16),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Consumer<images.Images>(
                                                  builder:
                                                      (context, value, child) =>
                                                          Image.network(
                                                              imageProvider
                                                                  .images[index]
                                                                  .imageUrl),
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text('NO')),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pushNamed(
                                                              '/imageView',
                                                              arguments: NetworkImage(
                                                                  imageProvider
                                                                      .images[
                                                                          index]
                                                                      .imageUrl));
                                                        },
                                                        child:
                                                            const Text('YES')),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ));
                                        });
                                  },
                                  child: Image.network(
                                      imageProvider.images[index].imageUrl),
                                ));
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    imageProvider.images[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    );
                  }),
            )));
  }
}
