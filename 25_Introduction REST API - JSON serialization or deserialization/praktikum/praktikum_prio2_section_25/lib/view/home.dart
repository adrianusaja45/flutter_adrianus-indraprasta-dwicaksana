import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/avatar_provider.dart';

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
        Provider.of<AvatarProvider>(context, listen: false).fetchAvatar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicebar Avatar'),
      ),
      body: Consumer<AvatarProvider>(
        builder: (context, data, child) {
          if (data.requestState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (data.requestState == RequestState.loaded) {
            final avatars = data.avatar!;
            print('AVATAR: $avatars');
            final item = avatars;
            return Center(
                child: SizedBox(
                    child: Image.network(
              item.image ?? '',
            )));
          } else {
            return Center(child: Text(data.message));
          }
        },
      ),
    );
  }
}
