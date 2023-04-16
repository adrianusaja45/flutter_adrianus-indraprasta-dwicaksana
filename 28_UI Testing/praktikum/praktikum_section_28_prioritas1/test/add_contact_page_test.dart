import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_section_28_prioritas1/add_contact_page.dart';
import 'package:praktikum_section_28_prioritas1/material_page.dart';

void main() {
  testWidgets('Tes App halaman home', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // The page title should be My Flutter App
    expect(find.text('My Flutter App'), findsOneWidget);

    // In the body of the page there must be a search iconButton
    expect(find.byType(IconButton), findsOneWidget);

    // The page body must have a floatingActionButton widget
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // The body of the page must contain a ListTile
    expect(find.byType(ListTile), findsNWidgets(7));

    // The body of the page must contain a BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Test App UI dari app advanced form halaman add contact',
      (tester) async {
    // TODO: Implement test

    await tester.pumpWidget(const MaterialApp(
      home: AddContact(),
    ));
//The page title must be Contacts
    expect(find.text('Contacts'), findsOneWidget);

// On the body of the page there must be a contact icon
    expect(find.byIcon(Icons.contacts), findsOneWidget);

    //in the body of the page there must be a title Create New Contacts

    expect(find.text('Create New Contacts'), findsOneWidget);

//in body of the page, description from Create New Contacts must available

    expect(
        find.text(
            'Silakan masukkan nama dan nomor telepon yang ingin anda masukkan kedalam daftar kontak'),
        findsOneWidget);

// in the body of the page there must be a textfield for the name to be inputted
    await tester.enterText(find.byKey(const Key('name')), 'Rizky');

// in the body of the page there must be a textfield for the phone number to be inputted
    await tester.enterText(find.byKey(const Key('number')), '08123456789');

// on the page there must be a textButton for the select datepicker
    await tester.tap(find.byType(TextButton));

// on the page there must be 4 elevated buttons consisting of a colorPicker button, a filePicker button, a submit button, a save edit button
    expect(find.byType(ElevatedButton), findsNWidgets(4));

    await tester.tap(find.byKey(const Key('submit')));
    await tester.pumpAndSettle();

// on the page there must be a Title from the Contact List
    expect(find.text('List Contacts'), findsOneWidget);

// on the page there must be a description that no contact has been entered
    expect(find.text('Belum ada Kontak yang ditambahkan'), findsOneWidget);

//On the Page there is a ListTile widget
    expect(find.byType(ListTile), findsNWidgets(0));
  });
}
