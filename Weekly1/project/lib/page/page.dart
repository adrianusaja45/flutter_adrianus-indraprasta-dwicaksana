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
      appBar: AppBar(
        title: SizedBox(
          child: Image.asset(
            'assets/apps_logo.png',
            height: 50,
            width: 50,
          ),
        ),
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
                    height: 300,
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
                          height: 125,
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
                          height: 100,
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
            Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      //Form First Name
                      SizedBox(
                        width: 200,
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
                      const SizedBox(width: 10),
                      //Form Last Name
                      SizedBox(
                        width: 200,
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
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(8)),
                      //Form Email
                      SizedBox(
                        width: 410,
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
                        width: 410,
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
            )
          ],
        ),
      ),
    );
  }
}
