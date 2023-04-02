part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  final List<AddContactList> contacts;
  const ContactState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class DisplayContact extends ContactState {
  final List<AddContactList> contact;

  const DisplayContact({required this.contact}) : super(contacts: contact);

  @override
  List<Object> get props => [contact];
  @override
  String toString() => 'Contact Added { contacts: $contact}';
}

class RemoveContact extends ContactState {
  final List<AddContactList> contact;

  const RemoveContact({required this.contact}) : super(contacts: contact);

  @override
  List<Object> get props => [contact];
  @override
  String toString() => 'Contact Removed { contacts: $contact}';
}

class UpdatesContact extends ContactState {
  final List<AddContactList> contact;

  const UpdatesContact({required this.contact}) : super(contacts: contact);

  @override
  List<Object> get props => [contact];
  @override
  String toString() => 'Contact Updated { contacts: $contact}';
}
