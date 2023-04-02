class Contact {
  String image, nama;
  int phone;

  Contact(this.image, this.nama, this.phone);

  static List<Contact> kontak = [
    Contact('assets/user1.png', 'Jake Wharton', 089452525252),
    Contact('assets/user2.png', 'Amit Shekhar', 089452525253),
    Contact('assets/user3.png', 'Romain Guy', 089452525254),
    Contact('assets/user4.png', 'Chris Banes', 089452525255),
    Contact('assets/user5.png', 'David', 089452525256),
    Contact('assets/user6.png', 'Ravi Tamada', 089452525257),
    Contact('assets/user7.png', 'Deny Prasetyo', 089452525258),
    Contact('assets/user8.png', 'Budi Oktaviyan', 089452525259),
    Contact('assets/user9.png', 'Hendi Santika', 089452525250),
    Contact('assets/user10.png', 'Sidiq Permana', 089452525251)
  ];
}
