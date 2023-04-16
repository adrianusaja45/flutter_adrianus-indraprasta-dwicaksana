import 'package:flutter/material.dart';
import 'add_contact_page.dart';
import 'learn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: buildListView(),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddContact()),
            );
          },
          foregroundColor: const Color(0xff0e1111),
          child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF6200EE),
          fixedColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.info), label: 'Information')
          ]),
    );
  }

  Widget buildListView() {
    return ListView.separated(
        itemCount: Learn.learn.length,
        separatorBuilder: (BuildContext context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(title: Text(Learn.learn[index].topic));
        });
  }
}
