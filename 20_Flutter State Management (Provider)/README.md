
# (20) Flutter State Management (Provider)




## Summary

State merupakan data yang dapat dibaca saat pembuatan widget, state juga dapat berubah saat widget sedang aktif dan hanya dimiliki oleh stateful widget. State dibuat sebgai property dari sebuah class dan digunakan pada widget saat proses build terjadi. Untuk mengubah state kita menggunakan setState. 

Pada Flutter State terbagi menjadi dua local state dan appState(Global state). Untuk local state menggunakan setState dan appState salah satunya bisa menggunakan provider.

Global state pada flutter dapat memudahkan kita untuk menggunakan state yang sama dengan mudah di seluruh widget.Pada Flutter terdapat Provider yang merupakan salah satu State management dan untuk menggunakannya kita perlu menginstallnya terlebih dahulu.

Untuk menerapkan provider kita harus membuat class provider terlebih dahulu dengan state/aksi yang ingin kita jalankan, lalu kita tambahkan return changeNotifierProvider pada main.dart , jika provider lebih dari satu gunakan MultiProvider untuk mendaftarkan state/data di hierarki paling atas. Untuk menggunakan state provider kita bisa menggunakan Provider.of(context) atau Consumer.









