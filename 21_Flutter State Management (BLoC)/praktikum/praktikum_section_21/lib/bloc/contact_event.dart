part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class CreateContact extends ContactEvent {
  final String nama;
  final int? number;
  final DateTime date;
  final Color warna;
  final File? file;

  const CreateContact(
      {required this.nama,
      required this.number,
      required this.date,
      required this.warna,
      required this.file});

  @override
  List<Object> get props => [nama, number!, date, warna, file!];
}

class DeleteContact extends ContactEvent {
  final int index;

  const DeleteContact({required this.index});

  @override
  List<Object> get props => [index];
}

class UpdateContact extends ContactEvent {
  final String nama;
  final int? number;

  const UpdateContact({required this.nama, required this.number});

  @override
  List<Object?> get props => [nama, number];
}

class GetContact extends ContactEvent {
  @override
  List<Object> get props => [];
}
