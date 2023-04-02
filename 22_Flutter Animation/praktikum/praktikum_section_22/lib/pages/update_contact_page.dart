import 'package:flutter/material.dart';
import 'package:praktikum_section_22/model/add_contact_list.dart';
import 'package:praktikum_section_22/pages/contact_page.dart';
import 'package:provider/provider.dart';
import 'package:praktikum_section_22/provider/added_contact.dart' as contacts;
import '../model/contacts.dart';

class UpdateContactPage extends StatefulWidget {
  const UpdateContactPage({super.key});

  // final AddContactList contact;
  @override
  State<UpdateContactPage> createState() => _UpdateContactPageState();
}

class _UpdateContactPageState extends State<UpdateContactPage> {
  var nameController = TextEditingController();

  var numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int indexTerpilih = -1;

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contacts.Contact>(context);
    final contactId = ModalRoute.of(context)!.settings.arguments as String;

    final contact = contactProvider.contacts
        .firstWhere((element) => element.id == contactId);

    nameController.text = contact.nama.toString();
    numberController.text = contact.number.toString();
    return WillPopScope(
      onWillPop: () async {
        await Navigator.of(context).pushAndRemoveUntil<dynamic>(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => const HomePage(),
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
            title: const Text('Update Contact'),
          ),
          body: Column(
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
                ]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        String nama = nameController.text.trim();
                        int number = int.parse(numberController.text.trim());
                        if (nama.isNotEmpty && number != 0) {
                          nameController.text = '';
                          numberController.text = '';
                          contactProvider.update(contact, nama, number);
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)))),
                      child: const Text('Save Edit'))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
            ],
          )),
    );
  }
}
