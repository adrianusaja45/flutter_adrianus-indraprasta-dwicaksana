import 'package:flutter/material.dart';

import '../apis/api_avatar.dart';
import '../models/avatar.dart';

enum RequestState { empty, loading, loaded, error }

class AvatarProvider extends ChangeNotifier {
  Avatar? _avatar;
  Avatar? get avatar => _avatar;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  Future<void> fetchAvatar() async {
    _requestState = RequestState.loading;
    notifyListeners();

    try {
      final result = await ApiAvatar.getAvatar();
      _avatar = result;
      print('RESULT: $result');
      _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      _message = e.toString();
      print(_message);
      notifyListeners();
    }
  }
}
