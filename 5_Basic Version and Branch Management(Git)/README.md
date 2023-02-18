
# (5) Version Control and Branch Management (Git)




## Summary

Versioning merupakan suatu cara developer mengatur versi source code pada program

Sama halnya dengan skripsi, pada pengembangan aplikasi juga tidak lepas dari revisi/update pada source code program agar dapat berjalan lebih baik

Version Control System terdiri dari 
* Single User : Bersifat Lokal
* Centralized : Terpusat dimana 1 server yang dikhususkan untuk project dapat diakses oleh banyak komputer
* Distributed : para developer bisa menyalin dari server remote ke lokal untuk bisa diedit/ diubah tanpa khawatir jika ada error yang terjadi tidak akan berpengaruh pada repository remote atau dapat mengupload repository dari lokal ke remote untuk melakukan perubahan terhadap repository yang ada di remote ketika sudah tidak ada bug, dan Git Merupakah salah satu Version Control System yang telah digunakan oleh banyak developer untuk mengatur perkembangan project.

Git dapat merekam semua perubahan yang dilakukan di banyak file dan di banyak user yang melakukan perubahan pada project. Sebelum ada github setiap perusahaan harus menyediakan layanan remote server untuk dapat menyimpan repository secara remote namun sekarang terdapat Github sebagai git hosting service yang bersifat gratis.

Staging Area dalam git terdiri dari working directory dimana user/developer melakukan perubahan atau penambahan file, lalu dilakukan perintah git add untuk menambahkan riwayat perubahan, lalu terdapat staging area dimana pada staging area ini akan dilakukan perintah git commit untuk menyimpan repository secara lokal, lalu saat ingin menyimpan ke repository remote maka kita menggunakan perintah git push.  

Untuk Workflow pada Github atau Gitlab disarankan terdapat branch master untuk produk final, branch dev untuk penyatuan dari beberapa branch fitur dan juga bug fix, lalu ada tiap fitur dibagi lagi menjadi masing2 fitur memiliki 1 branch, begitu juga dengan bug fix, lalu di akhir pengembangan maka akan disatukan di branch dev , dilakukan testing, dan jika sudah sesuai maka akan dimerge ke master.