
# (27) Finite State Machine & Unit Testing




## Summary

Finite State Machine merupakan mesin yang memiliki sejumlah state. Tiap state menunjukkan apa yang terjadi sebelumnya.

contoh state yaitu empty/idle saat tidak terjadi proses, loading/running saat proses sedang berjalan, loaded saat proses telah berhasil dijalankan dan mendapatkan hasil, error saat proses gagal.

Unit Test merupakan salah satu jenis pengujian pada perangkat lunak dimana pengujiannya dilakukan pada fungsi atau method dari aplikasi yang kita buat. 

Tujuan dari Unit Test yaitu untuk memastikan fungsi dapat mengolah berbagai jenis input, hasil dari method, dan juga bisa dijadikan dokumentasi.

Unit Test bisa dilakukan secara manual, dan automated dengan menulis script yang dapat dijalankan menggunakan test runner. Untuk Dependency yang dapat digunakan yaitu package test.

Untuk mengelompokkan test dengan subjek yang sama bisa diletakkan dalam sebuah kelompok dengan menggunakan Group.

Mocking merupakan metode testing untuk menghindari ketergantungan dari sistem eksternal. 

Untuk cara kerjanya, pertama buat bentuk tiruan dari object, tiruan ini memiliki input dan output yang sama dengan yang asli. Untuk package yang digunakan yaitu mockito dan build_runner.