import 'package:flutter/material.dart';
import 'package:praktikum_section_22/pages/update_contact_page.dart';
import 'package:praktikum_section_22/provider/added_contact.dart';
import 'package:praktikum_section_22/widget/custom_page_route.dart';
import 'package:provider/provider.dart';
import 'add_contact_page.dart';
// import 'contacts.dart';
import 'package:praktikum_section_22/model/learn.dart';

//Soal Prioritas 1

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text('MaterialApp'),

//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: const [
//             ListTile(title:  Text('Home')),
//             ListTile(title: Text('Settings'))
//           ],
//         ),
//       ),
// Prioritas No.1
// body: const Center(
//   child : Text('This is MaterialApp')
// ),

//Soal Prioritas 1 No.2

//       body : ListView.builder(
//         itemCount: Contact.kontak.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title:  Text(Contact.kontak[index].nama),
//             subtitle: Text(Contact.kontak[index].phone.toString()),
//             leading: CircleAvatar(
//                 backgroundImage: AssetImage(Contact.kontak[index].image)
//             )
//           );
//         }),
//       bottomNavigationBar: BottomNavigationBar(items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting')
//       ]),
//     );
//   }
// }

//Soal Eksplorasi

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a Search Icon')));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Consumer<Contact>(
          builder: (context, contact, child) => (Center(
                child: Expanded(
                    child: Column(
                  children: [
                    Title(
                        color: Colors.black,
                        child: const Text('List Contacts',
                            style: TextStyle(fontSize: 24))),
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
                    )
                  ],
                )),
              ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, CustomPageRoute(child: const AddContact()));
        },
        foregroundColor: const Color(0xff0e1111),
        label: const Text('Create/Manage Contact'),
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
