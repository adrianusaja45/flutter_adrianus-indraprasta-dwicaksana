
# (13) Flutter Platform Widget




## Summary

Dalam Flutter kita bisa menggunakan widget dengan gaya berbeda pada Android dan iOS.

MaterialApp yaitu widget dasar yang mengemas seluruh widget dalam aplikasi. MaterialApp digunakan dan dikhususkan untuk sistem Android.
kita bisa mengimport MaterialApp dengan cara import: 'package: flutter/material.dart';

Pada materialApp terdapat theme yang berfungsi mengatur warna tema, dan home yang merupakan halaman utama dan yang dibuka pertama kali saat aplikasi dijalankan. Dalam MaterialApp juga kita bisa mengatur halaman dengan menggunakan routes dan initial routes (route utama). Scaffold merupakan widget dasar untuk membangun sebuah halaman pada MaterialApp. Untuk membentuk tata letak dasar halaman dapat ditulis melalui properti seperti appBar(bar menu bagian atas halaman), drawer(menu bagian samping halaman),body(bagian halaman utama),bottomNavigationBar(menu bagian bawah halaman).

Sama seperti MaterialApp, CupertinoApp merupakan widget dasar yang mengemas seluruh widget dalam aplikasi namun widget ini digunakan dan dikhususkan untuk sistem iOS, widget ini dapat diimport dengan import: 'package:flutter/cupertino.dart';

karena pada Cupertino tidak menyediakan ThemeData.dark()  kita perlu mengatur secara manual melalui CupertinoThemeData.raw yang berisi brightness.dark.Sama seperti MaterialApp, Widget yang pertama kali dibuka di Cupertino diletakkan pada bagian home, theme untuk mengatur tema.

CupertinoPageScaffold merupakan widget dasar untuk membangun sebuah halaman pada CupertinoApp. Terdapat navigationBar(Bar menu bagian atas halaman) dan child(bagian utama halaman) pada CupertinoPageScaffold.