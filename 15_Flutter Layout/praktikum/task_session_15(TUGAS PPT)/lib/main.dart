import 'package:flutter/material.dart';
import 'data.dart';
import 'grid_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JSON ListView in Flutter'),
        ),
        body: Column(children: [
          Expanded(child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){
            
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green,child: Text(data[index]["username"]![0]),),
              title: Text(data[index]["username"]!),
              subtitle: Text(data[index]["phone"]!),
            );
          } 
          
          ),),
          TextButton(onPressed: (){
            Navigator.push(
              context,
           MaterialPageRoute(builder: (context) => const MyWidget()),
             );
          }, child: const Text('GridView Icon') )
        ],)
      );
  }
}
