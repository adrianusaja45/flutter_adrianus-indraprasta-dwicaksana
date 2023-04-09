import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:praktikum_section_23/model/add_contact_list.dart';
import 'package:praktikum_section_23/pages/navbar.dart';

import 'package:praktikum_section_23/provider/added_contact.dart' as contacts;
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  int indexTerpilih = -1;
  Color _currentColor = Colors.black;
  File? fileBuka;

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              title: const Text('Contacts'),
              centerTitle: true,
            ),
            body: ListView(children: [addContactWidget(context)])));
  }

  Widget addContactWidget(BuildContext context) {
    final contactProvider = Provider.of<contacts.Contact>(context);
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 40)),
        const Icon(Icons.contacts),
        const SizedBox(height: 20),
        Title(
            color: Colors.black,
            child: const Text('Create New Contacts',
                style: TextStyle(fontSize: 24))),
        const SizedBox(height: 20),
        const Text(
            'Silakan masukkan nama dan nomor telepon yang ingin anda masukkan kedalam daftar kontak'),
        const SizedBox(height: 20),
        const Divider(
            color: Colors.grey,
            height: 5,
            thickness: 3,
            indent: 100,
            endIndent: 100),
        const SizedBox(height: 20),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(children: [
            SizedBox(
                width: 550,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 206, 206, 206),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: Text(
                        'Name',
                        style: TextStyle(color: Colors.black),
                      ),
                      hintText: 'Insert Your Name'),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukan Nama';
                    }
                    return null;
                  },
                )),
            const SizedBox(height: 20),
            SizedBox(
                width: 550,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly], // formatter hanya angka
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 206, 206, 206),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: Text(
                        'Nomor',
                        style: TextStyle(color: Colors.black),
                      ),
                      hintText: '+62 ...'),
                  controller: numberController,
                  //validator
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Nomor Telepon';
                    } else if (value.length < 8) {
                      return 'Nomor Telepon tidak boleh kurang dari 8 ';
                    } else if (value.length > 15) {
                      return 'Nomor Telepon tidak boleh lebih dari 15';
                    }
                    return null;
                  },
                )),
            buildDatePicker(context),
            buildColorPicker(context),
            buildFilePicker(context),
            (fileBuka == null)
                ? Container()
                : SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.file(fileBuka!),
                  ),
          ]),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 350, right: 10)),
            ElevatedButton(
                onPressed: () {
                  final FormState? form = formKey.currentState;
                  String nama = nameController.text.trim();
                  int? number = int.tryParse(numberController.text.trim());
                  DateTime date = _dueDate;
                  Color warna = _currentColor;
                  File? file = fileBuka;
                  // setelah tervalidasi maka proses add contact akan dijalankan
                  if (form!.validate()) {
                    formKey.currentState!.save();
                    nameController.text = '';
                    numberController.text = '';
                    int index = 0;
                    contactProvider.add(AddContactList(
                        id: '${index + 1}',
                        nama: nama,
                        number: number,
                        date: date,
                        warna: warna,
                        file: file));
                    Navigator.pop(context);

                    for (var element in contactProvider.contacts) {
                      print(
                          "Nama : ${element.nama} \n Nomor : ${element.number}");
                    }
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                child: const Text('Submit')),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 50)),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 45)),
            const Text('Date'),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));

                  setState(() {
                    if (selectDate != null) {
                      _dueDate = selectDate;
                    }
                  });
                },
                child: const Text('Select')),
            Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
          ],
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 10,
          width: 10,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick your Color'),
                        content: SingleChildScrollView(
                          child: SlidePicker(
                              pickerColor: _currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _currentColor = color;
                                });
                              }),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('save'))
                        ],
                      );
                    });
              },
              child: const Text('Pick Color')),
        )
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Pick File'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              onPressed: () {
                _pickFile();
              },
              child: const Text('Choose and Open File')),
        )
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    //mendapatkan file dari object result
    final file = result.files.first;
    Image.file(File(file.path.toString()));

    final path = result.files.single.path!;

    setState(() {
      fileBuka = File(path);
    });
  }
}
