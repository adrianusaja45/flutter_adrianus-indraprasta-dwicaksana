import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/add_contact_list.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const DisplayContact(contact: [])) {
    on<CreateContact>((event, emit) {
      contacts.add(AddContactList(
        nama: event.nama,
        number: event.number,
        date: event.date,
        warna: event.warna,
        file: event.file,
      ));
      emit(DisplayContact(contact: _contacts));
    });

    on<DeleteContact>((event, emit) {
      contacts.removeAt(event.index);
      emit(RemoveContact(contact: _contacts));
    });

    on<UpdateContact>((event, emit) {
      int index = 0;

      _contacts[index].nama = event.nama;
      _contacts[index].number = event.number;
      emit(UpdatesContact(contact: _contacts));
    });
  }
  final List<AddContactList> _contacts = [];
  List<AddContactList> get contacts => _contacts;
}
