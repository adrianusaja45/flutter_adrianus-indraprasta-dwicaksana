
# (16) Flutter Form & Advance Form Input




## Summary

Form menerima isian data input dari pengguna, isian data yang diterima bisa lebih dari satu. Untuk membuat form kita menggunakan statefulWidget dan menggunakan GlobalKey<FormState> untuk menyimpan keadaan form sebagai key dari form.

Input pada form terdiri dari TextField berbentuk kolom isian yang menerima isian data input dari pengguna dalam bentuk text. Data diambil menggunakan TextEditingController. Radio digunakan sebagai input berbentuk opsi dan opsi yang bisa dipilih oleh pengguna hanya satu. Data yang diambil menggunakan property yang tipe datanya sesuai dengan value pada radio. Checkbox sama seperti radio yang memberi opsi, tapi pada checkbox pengguna dapat memilih beberapa opsi. Data yang diambil dari checkbox menggunakan property tipe data bool. Pada Drop Down button pengguna hanya bisa memilih satu opsi, opsi tidak ditampilkan diawal tapi saat ditekan. Data yang diambil menggunakan property dengan tipe data sesuai value pada opsi DropdownMenuItem. 

Button dapat melakukan suatu proses saat ditekan. ElevatedButton merupakan tombol yang timbul dan jika ditekan maka onPressed() akan dijalankan. Icon Button merupakan button dalam tampilan icon dan jika ditekan akan menjalankan onPressed()


Interactive widgets merupakan widget yang menjembatani interaksi antara aplikasi dengan user dan mengumpulkan input dan feedback dari user. Pada flutter terdapat interactive widget DatePicker,ColorPicker,dan FilePicker

DatePicker merupakan sebuah widget dimana pengguna bisa memilih tanggal sebagai inputan data misalnya tanggal kelahiran, tanggal reservasi , jadwal meeting, dll. Fungsi showDatePicker memiliki tipe data future.

ColorPicker merupakan widget dimana user bisa memilih warna. Penggunakan color picker bisa digunakan di berbagai macam kondisi. Package yang digunakan yaitu flutter_colorpicker .

FilePicker merupakan widget yang memiliki kemampuan untuk mengakses storage agar bisa memilih dan membuka file pada perangkat.




