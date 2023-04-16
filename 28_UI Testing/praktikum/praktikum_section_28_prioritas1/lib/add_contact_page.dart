// import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:developer' as logDev;

import 'add_contact_list.dart';

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
  List<AddContactList> contact = [];
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
        ),
        body: ListView(children: [addContactWidget(context)]));
  }

  Widget addContactWidget(BuildContext context) {
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
                  key: const Key('name'),
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
                  key: const Key('number'),
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
                    width: 100, height: 100, child: Image.file(fileBuka!)),
          ]),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 100, right: 10)),
            ElevatedButton(
                key: const Key('submit'),
                onPressed: () {
                  final FormState? form = formKey.currentState;
                  String nama = nameController.text.trim();
                  int? number = int.tryParse(numberController.text.trim());
                  DateTime date = _dueDate;
                  Color warna = _currentColor;
                  File? file = fileBuka;
                  // setelah tervalidasi maka proses add contact akan dijalankan
                  if (form!.validate()) {
                    setState(() {
                      nameController.text = '';
                      numberController.text = '';
                      date = currentDate;

                      contact.add(AddContactList(
                          nama: nama,
                          number: number,
                          date: date,
                          warna: warna,
                          file: file));

                      for (var element in contact) {
                        print(
                            "Nama : ${element.nama} \n Nomor : ${element.number}");
                      }
                    });
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                child: const Text('Submit')),
            const SizedBox(width: 50),
            ElevatedButton(
                key: const Key('edit'),
                onPressed: () {
                  String nama = nameController.text.trim();
                  int number = int.parse(numberController.text.trim());
                  if (nama.isNotEmpty && number != 0) {
                    setState(() {
                      nameController.text = '';
                      numberController.text = '';
                      contact[indexTerpilih].nama = nama;
                      contact[indexTerpilih].number = number;
                      indexTerpilih = -1;
                    });
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                child: const Text('Save Edit'))
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 50)),
        Title(
            color: Colors.black,
            child: const Text('List Contacts', style: TextStyle(fontSize: 24))),
        const Padding(padding: EdgeInsets.only(top: 50)),
        contact.isEmpty
            ? const Text(
                'Belum ada Kontak yang ditambahkan',
                style: TextStyle(fontSize: 20),
              )
            : SizedBox(
                height: 200,
                child: ListView.separated(
                    itemCount: contact.length,
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    separatorBuilder: (BuildContext context, index) =>
                        const Divider(),
                    itemBuilder: ((context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _currentColor.withOpacity(0.2),
                          child: Text(
                            contact[index].nama[0].toUpperCase(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 96, 4, 112)),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contact[index].nama,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(contact[index].number.toString()),
                            Text(
                                'Date Added : ${contact[index].date?.day}-${contact[index].date?.month}-${contact[index].date?.year}'),
                            Row(
                              children: [
                                const Text('Color : '),
                                const SizedBox(height: 10),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: _currentColor,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                            (fileBuka == null)
                                ? Container()
                                : SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(fileBuka!)),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    nameController.text = contact[index].nama;
                                    numberController.text =
                                        contact[index].number.toString();
                                    setState(() {
                                      indexTerpilih = index;
                                    });
                                  },
                                  icon: const Icon(Icons.edit_outlined)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      contact.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete_outline))
                            ],
                          ),
                        )))),
              )
      ],
    );
  }

  // Widget getList(int index) {
  //   return ListTile(
  //       leading: CircleAvatar(
  //         backgroundColor: _currentColor.withOpacity(0.2),
  //         child: Text(
  //           contact[index].nama[0].toUpperCase(),
  //           style: const TextStyle(color: Color.fromARGB(255, 96, 4, 112)),
  //         ),
  //       ),
  //       title: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(contact[index].nama,
  //               style: const TextStyle(fontWeight: FontWeight.bold)),
  //           Text(contact[index].number.toString()),
  //           Text(
  //               'Date Added : ${contact[index].date?.day}-${contact[index].date?.month}-${contact[index].date?.year}'),
  //           Row(
  //             children: [
  //               const Text('Color : '),
  //               const SizedBox(height: 10),
  //               Container(
  //                 height: 10,
  //                 width: 10,
  //                 decoration: BoxDecoration(
  //                     color: _currentColor,
  //                     borderRadius: BorderRadius.circular(10)),
  //               ),
  //             ],
  //           ),
  //           (fileBuka == null)
  //               ? Container()
  //               : SizedBox(
  //                   width: 100, height: 100, child: Image.file(fileBuka!)),
  //         ],
  //       ),
  //       trailing: SizedBox(
  //         width: 100,
  //         child: Row(
  //           children: [
  //             IconButton(
  //                 onPressed: () {
  //                   nameController.text = contact[index].nama;
  //                   numberController.text = contact[index].number.toString();
  //                   setState(() {
  //                     indexTerpilih = index;
  //                   });
  //                 },
  //                 icon: const Icon(Icons.edit_outlined)),
  //             IconButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     contact.removeAt(index);
  //                   });
  //                 },
  //                 icon: const Icon(Icons.delete_outline))
  //           ],
  //         ),
  //       ));
  // }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      key: const Key('datePicker'),
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
      key: const Key('colorPicker'),
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
      key: const Key('filePicker'),
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
