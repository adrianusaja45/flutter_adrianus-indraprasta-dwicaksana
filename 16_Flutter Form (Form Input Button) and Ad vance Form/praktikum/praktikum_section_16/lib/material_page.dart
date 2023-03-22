import 'package:flutter/material.dart';
import 'add_contact_page.dart';
// import 'contacts.dart';
import 'learn.dart';

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
