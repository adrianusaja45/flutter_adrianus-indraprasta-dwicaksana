import 'package:flutter/material.dart';
import 'package:praktikum_section_23/model/db_manager.dart';
import 'package:praktikum_section_23/provider/added_contact.dart';
import 'package:provider/provider.dart';
import 'provider/all_image.dart' as image;

// import 'cupertino_app.dart';
import 'material_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Contact(),
        ),
        ChangeNotifierProvider(create: (_) => image.Images())
      ],
      child: const App(),
    ),
  );
}
