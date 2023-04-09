import 'package:flutter/material.dart';
import 'package:praktikum_section_25/models/contact.dart';
import 'package:praktikum_section_25/view_model/contact_provider.dart';
import 'package:provider/provider.dart';

class ManageContact extends StatefulWidget {
  const ManageContact({super.key});

  @override
  State<ManageContact> createState() => _ManageContactState();
}

class _ManageContactState extends State<ManageContact> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  final addContact = Contact(
                      name: _nameController.text.trim(),
                      phone: _phoneController.text.trim());

                  Provider.of<ContactProvider>(context, listen: false)
                      .addContact(addContact);

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name: ${addContact.name}'),
                              Text('Phone: ${addContact.phone}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'))
                          ],
                        );
                      });
                },
                child: const Text('Create Contact'),
              )
            ],
          ),
        ));
  }
}
