import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/added_contact.dart' as contact;
import 'provider/all_image.dart' as image;

// import 'cupertino_app.dart';
import 'material_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => contact.Contact(),
        ),
        ChangeNotifierProvider(create: (_) => image.Images())
      ],
      child: const App(),
    ),
  );
}
