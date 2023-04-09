import 'package:flutter/material.dart';
import 'package:praktikum_section_25/view/update_page.dart';
import 'package:praktikum_section_25/view_model/contact_provider.dart';
import 'package:provider/provider.dart';

import 'manage_contact.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>
        Provider.of<ContactProvider>(context, listen: false).fetchContacts());
    Future.microtask(() => Provider.of<ContactProvider>(context, listen: false)
        .fetchJSONContact());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdatePage()));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, value, child) {
          if (value.state == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.state == RequestState.loaded) {
            final jsonContact = value.jsonContacts;
            final contacts = value.contacts;
            return Column(
              children: [
                ListTile(
                  title: Text(jsonContact?.name ?? ''),
                  subtitle: Text(jsonContact?.phone ?? ''),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: value.contacts.length,
                    itemBuilder: (context, index) {
                      final contactItem = contacts[index];
                      return ListTile(
                        title: Text(value.contacts[index].name),
                        subtitle: Text(value.contacts[index].phone),
                      );
                    })
              ],
            );
          } else if (value.state == RequestState.error) {
            return Center(child: Text(value.message));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ManageContact()));
          },
          label: const Text('Manage Contact')),
    );
  }
}
