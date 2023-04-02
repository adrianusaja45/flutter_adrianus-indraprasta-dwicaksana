
# (21) Flutter State Management (BLoC)



## Summary

BLoC merupakan singkatan dari Business Logic Component. Merupakan salah satu state management di flutter yang memisahkan antara business logic dengan UI. Cara kerja dari BLoC yaitu pertama, BLoC akan menerima event sebagai input lalu di dalam BLoC akan dianalisa dan dikelola di dalam BLoC, setelah itu akan menghasilkan state berupa output.

Stream amerupakan rangkaian proses aliran data secara asynchronous yang merupakan aktor utama di dalam BLoC. Untuk menerapkan BLoC kita memerlukan extension bloc yang dapat membantu membuat folder BLoC, setelah itu kita juga perlu menginstall dependency flutter_bloc dan equatable. 

Pertama-tama kita perlu mengatur atau menyusun event, setelah itu kita mengatur atau menyusun state dan terakhir pada bloc kita menambahkan logika bisnis. Setelah itu kita perlu menambahkan BlocProvider di main.dart agar Bloc dapat digunakan oleh semua widget tree dibawahnya. Lalu kita tambahkan BlocBuilder pada widget yang kita inginkan agar dapat mendapatkan state.











