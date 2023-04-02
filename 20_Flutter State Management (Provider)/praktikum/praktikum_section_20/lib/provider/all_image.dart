import 'package:flutter/material.dart';
import 'package:praktikum_section_20/model/image_list.dart';

class Images with ChangeNotifier {
  final List<ImageList> _images = List.generate(
      5,
      (index) =>
          ImageList(imageUrl: 'https://picsum.photos/id/$index/200/300'));

  List<ImageList> get images {
    return _images;
  }
}
