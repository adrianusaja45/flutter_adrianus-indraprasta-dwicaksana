
# (22) Flutter Animation



## Summary

Animasi dapat membuat aplikasi terlihat hidup, widget yang bergerak menggunakan animasi dapat menambah daya tarik, animasi dapat terjadi ketika ada pergerakan dari kondisi A ke kondisi B. Di flutter sendiri tersedia versi animasi dari widget yang sudah ada seperti AnimatedContainer. 

Penggunaan animasi dapat membuat kita nyaman menggunakan aplikasi. Transition merupakan animasi yang terjadi saat perpindahan antar halaman dan dapat dilakukan pada bagian Navigator.push() .

Untuk menerapkan Transition kita bisa menggunakan PageRouteBuilder di dalam Navigator.push() yang akan mereturn animasi. Terdapat juga transition builder dimana kita mengatur kondisi awal dan akhir seperti posisi page yang sebelumnya tidak ada kita isi value offset begin dan end agar berhenti ketika posisi sudah diujung setelah perpindahan.  

Ada juga FadeTransition dimana efek animasi berubah dari yang awalnya redup menjadi terlihat dengan jelas. Lalu ada juga ScaleTransition yang merupakan efek animasi dimana halaman muncul dari ukuran kecil menjadi tampilan layar penuh.










