
# (17) Assets




## Summary

Asset merupakan file yang di-bundled dan di-deploy bersamaan dengan aplikasi saat proses run. Tipe-tipe dari assets terdiri dari static data (JSON files), icon, gambar/image dan font file (berupa .ttf).

Untuk menerapkan assets kita menggunakan pubspec.yaml . File tersebut terletak pada root directory project, fungsinya yaitu untuk mengidentifikasi assets yang dibutuhkan oleh aplikasi.

Image atau gambar berfungsi untuk meningkatkan tampilan menjadi lebih menarik dan enak dipandang. Format gambar yang didukung flutter yaitu JPEG,WebP,GIF, PNG, BMP, dan WBMP. Untuk menampilkan gambar pada aplikasi kita bisa menggunakan AssetImage(), NetworkImage(), Image.aseet(), dan Image.Network(). Untuk asset dimanfaatkan untuk menampilkan gambar dari file lokal project sedangkan network menampilkan gambar dari internet dengan memasukan URL.

Font merupakan salah satu faktor yang menjadi keunikan dari sebuah aplikasi. Penggunaan font style biasanya ditentukan oleh UI designer. Penggunaan font bisa menggunakan custom font atau dari package. Untuk custom font kita bisa mencari font yang diinginkan di fonts.google.com setelah berhasil mendownload kita mengimportnya kedalam folder project kita. Mendaftarkannya ke pubspec.yaml dan menerapkan font sebagai default di ThemeData().

Untuk menggunakannya secara spesifik bisa dengan menerapkan font style di teks yang diinginkan. Jika ingin menggunakan font dari package kita bisa mengimport dependencies google_fonts. lalu jika ingin memilih salah satu style tinggal mengetik GoogleFonts.poppins(fontsize:20) misalnya.




