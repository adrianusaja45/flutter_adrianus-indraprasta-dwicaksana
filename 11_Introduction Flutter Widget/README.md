
# (11) Introduction Flutter Widget




## Summary

Flutter merupakan alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan juga web. Keunggulan dari menggunakan flutter yaitu mudah digunakan dan dipelajari, produktivitas tinggi dan juga efisiwen, dokumentasi lengkap, dan komunitas yang terus berkembang dari waktu ke waktu.

Flutter terdiri dari Framework dan SDK (Software Development Kit). SDK merupakan alat-alat yang dapat membantu dalam proses pengembangan aplikasi. Flutter merupakan framework yang memiliki perlengkapan untuk membentuk aplikasi yang dapat dikustomisasi. 

Saat membuat project flutter baru, didalamnya terdapat beberapa folder yaitu direktori platform seperti android, ios,web dan direktori project lib dimana ini merupakan ruang kerja utama saat membuat aplikasi, test dikhususkan untuk aktivitas pengujian.

Widget pada flutter digunakan untuk membentuk antarmuka (UI), berupa class. dan satu widget bisa terdiri dari beberapa widget lainnya. Widget dibagi menjadi dua, stateless widget dan stateful widget. Stateless widget tidak bergantung pada perubahan data dan hanya fokus pada tampilan UI saja, dibuat dengan extends pada class StatelessWidget. Stateful widget mementingkan pada perubahan data, dibuat dengan extends pada class StatefulWidget, dan satu widget menggunakan 2 class (widget dan state yang dijalankan)

Built in widget merupakan widget yang dapat langsung digunakan dan sudah tersedia bersamaan dengan flutter saat sudah di-install. MaterialApp digunakan agar bisa membuat aplikasi dengan desain material. Scaffold digunakan untuk membuat sebuah halaman aplikasi. AppBar digunakan untuk membentuk application bar yang terletak pada bagian atas halaman dan biasanya diisi title/judul. Text digunakan untuk menampilkan text pada aplikasi.
