import 'package:flutter/material.dart';
import 'package:praktikum_section_23/pages/login_page.dart';
import 'package:praktikum_section_23/provider/added_contact.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/custom_page_route.dart';
import 'add_contact_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late SharedPreferences dataLogin;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    dataLogin = await SharedPreferences.getInstance();
    setState(() {
      username = dataLogin.getString('username') ?? 'Tidak ada data';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Page'),
      ),
      body: Consumer<Contact>(
          builder: (context, contact, child) => (Center(
                child: Column(
                  children: [
                    Title(
                        color: Colors.black,
                        child: const Text('List Contacts',
                            style: TextStyle(fontSize: 24))),
                    Text('Halo, $username'),
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    contact.contacts.isEmpty
                        ? const SizedBox(
                            height: 500,
                            child: Text(
                              'Belum ada Kontak yang ditambahkan',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        : SizedBox(
                            height: 500,
                            child: ListView.separated(
                                itemCount: contact.contacts.length,
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                separatorBuilder:
                                    (BuildContext context, index) =>
                                        const Divider(),
                                itemBuilder: ((context, index) =>
                                    getList(index))),
                          ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/gallery');
                      },
                      child: const Text('Go to Gallery Page'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        dataLogin.setBool('login', true);
                        dataLogin.remove('username');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false);
                      },
                      child: const Text('Log Out'),
                    )
                  ],
                ),
              ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, CustomPageRoute(child: const AddContact()));
        },
        foregroundColor: const Color(0xff0e1111),
        label: const Text('Create Contact'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

Widget getList(int index) {
  return Consumer<Contact>(
      builder: (context, contact, child) => ListTile(
            leading: CircleAvatar(
              backgroundColor: contact.contacts[index].warna.withOpacity(0.2),
              child: Text(
                contact.contacts[index].nama[0].toUpperCase(),
                style: const TextStyle(color: Color.fromARGB(255, 96, 4, 112)),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.contacts[index].nama,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(contact.contacts[index].number.toString()),
                Text(
                    'Date Added : ${contact.contacts[index].date?.day}-${contact.contacts[index].date?.month}-${contact.contacts[index].date?.year}'),
                Row(
                  children: [
                    const Text('Color : '),
                    const SizedBox(height: 10),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: contact.contacts[index].warna,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                (contact.contacts[index].file == null)
                    ? Container()
                    : SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.file(contact.contacts[index].file!)),
              ],
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/updateContact',
                            arguments: contact.contacts[index].id);
                      },
                      icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      onPressed: () {
                        contact.remove(index);
                      },
                      icon: const Icon(Icons.delete_outline))
                ],
              ),
            ),
          ));
}
