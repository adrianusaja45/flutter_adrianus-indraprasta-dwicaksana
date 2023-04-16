import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Header atau AppBar
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/apps_logo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column()),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Contact Us'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: SizedBox(
          child: Image.asset(
            'assets/apps_logo.png',
            height: 50,
            width: 50,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF03DAC5)),
      ),

      //ScrollView
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Bagian Welcome
            Container(
              alignment: Alignment.topCenter,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/banner.jpg',
                    height: 330,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 400,
                          height: 135,
                          child: Text(
                            'Aplikasi Job Finder yang Memprioritaskan Lulusan SMA di Indonesia untuk Mendapatkan Pekerjaan yang Layak',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 400,
                          height: 130,
                          child: Text(
                            'Aplikasi ini menyediakan fitur yang mewadahi para pengguna yang sedang mencari lowongan pekerjaan maupun klien atau '
                            'perusahaan yang sedang mencari pekerja dengan mengirimkan lowongan pekerjaan di dalam aplikasi ini dengan mudah.'
                            'Aplikasi ini juga menunjang keterbatasan pengguna yang mungkin masih awam soal penggunaan'
                            'aplikasi Android dengan memberikan pengalaman pemanfaatan aplikasi dengan mudah.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF03DAC5)),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color(0xFF03DAC5))),
                            onPressed: () {},
                            child: const Text('Pelajari Lebih Lanjut'))
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Contact Us Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              child: Column(
                children: [
                  //Form First Name
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      SizedBox(
                        width: 200,
                        height: 80,
                        child: TextFormField(
                          controller: firstNameController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 206, 206, 206),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            label: Text(
                              'First Name',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            hintText: ('Enter your first name'),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukan Nama Depan';
                            } else if (value.length < 3) {
                              return 'Nama terlalu pendek';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  //Form Last Name
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      SizedBox(
                        width: 200,
                        height: 80,
                        child: TextFormField(
                          controller: lastNameController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 206, 206, 206),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            label: Text(
                              'Last Name',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            hintText: ('Enter your last name'),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukan Nama Akhir';
                            } else if (value.length < 3) {
                              return 'Nama terlalu pendek';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      //Form Email
                      SizedBox(
                        width: 300,
                        height: 80,
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Colors.black,
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 206, 206, 206),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            label: Text(
                              'Email',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            hintText: ('Enter your Email Adress'),
                          ),
                          validator: (value) =>
                              value != null && !EmailValidator.validate(value)
                                  ? 'Masukan email yang valid'
                                  : null,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      //Form Message
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                            controller: messageController,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 206, 206, 206),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: ('What can we help you with?'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan pesan yang ingin disampaikan';
                              }
                              return null;
                            }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      //Submit Button
                      ElevatedButton(
                          onPressed: () {
                            final FormState? form = formKey.currentState;
                            String namaDepan = firstNameController.text.trim();
                            String namaAkhir = lastNameController.text.trim();
                            String email = emailController.text.trim();
                            String message = messageController.text.trim();
                            // setelah tervalidasi maka proses add contact akan dijalankan
                            if (form!.validate()) {
                              setState(
                                () {
                                  firstNameController.text = '';
                                  lastNameController.text = '';
                                  emailController.text = '';
                                  messageController.text = '';
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                            child: SizedBox(
                                          width: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Nama Depan : $namaDepan'),
                                                Text('Nama Akhir : $namaAkhir'),
                                                Text('Email : $email'),
                                                Text('Message : $message'),
                                                const SizedBox(height: 15),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Close',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ));
                                      });
                                },
                              );
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFF03DAC5)),
                          ),
                          child: const Text('Submit')),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 300,
              child: Column(
                children: [
                  const Text(
                    'About Us',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: const Color(0xFF03DAC5),
                        child: SizedBox(
                            height: 225,
                            width: 150,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.work,
                                  size: 50,
                                  color: Colors.orange,
                                ),
                                Text(
                                  'Temukan Pekerjaan Impianmu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  'Mencari pekerjaan yang menjadi impian bukanlah hal yang mustahil. Selama ada keinginan dan usaha yang kuat, maka jalan menuju tujuan yang diimpikan akan semakin terbuka.'
                                  'di SayapRaja Kamu bisa mencari pekerjaan yang sesuai dari syarat pendidikan dan juga gaji yang sesuai',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                          color: const Color(0xFF03DAC5),
                          child: SizedBox(
                            height: 225,
                            width: 150,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.handshake_outlined,
                                  size: 50,
                                  color: Colors.orange,
                                ),
                                Text(
                                  'Temukan Karyawan Idealmu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  'Mencari karyawan yang ideal di jenjang pendidikan SMA sulit jika dilakukan secara manual , namun dengan SayapRaja '
                                  'Kamu bisa mencari karyawan yang kemampuannya sesuai dengan kebutuhan perusahaan dengan mudah dan cepat',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF03DAC5),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
