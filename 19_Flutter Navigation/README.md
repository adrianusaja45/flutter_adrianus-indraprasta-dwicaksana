
# (19) Flutter Navigation




## Summary

Navigation merupakan fungsi yang membantu kita untuk berpindah halaman , misalnya halaman home screen ke halaman detail. Untuk berpindah halaman kita bisa menggunakan fungsi Navigator.push() dan untuk kembali ke halaman sebelumnya bisa menggunakan Navigator.pop().

Untuk mengirim data/ passing data kita bisa memasukan parameter pada constructor halaman. Kita membuat variabel parameter dan memasukkannya ke parameter sebagai required. dan dihalaman yang dijadikan pengirim data masukkan data yang ingin dikirim pada parameternya.

Setiap halaman pada Flutter memiliki alamat yang disebut route. Untuk melakukan perpindahan halaman kita juga bisa menggunakan Navigator.pushNamed() untuk pergi ke halaman tujuan, dan Navigator pop ke halaman sebelumnya.

Pertama-tama kita perlu menambahkan initialRoute dan routes pada MaterialApp, tiap route merupakan fungsi yang membentuk sebuah halaman. Untuk mengirim data kita bisa menggunakan arguments saat menjalankan pushNamed.









