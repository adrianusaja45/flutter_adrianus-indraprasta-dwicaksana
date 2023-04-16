import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../view_model/post_provider.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose

    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Post'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  final updatePost = Posts(
                      title: _titleController.text.trim(),
                      body: _bodyController.text.trim());
                  Provider.of<PostProvider>(context, listen: false)
                      .updatePost(updatePost);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Post Has been Updated'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Title: ${updatePost.title}'),
                                Text('Body: ${updatePost.body}'),
                              ],
                            ),
                          ));
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ));
  }
}
