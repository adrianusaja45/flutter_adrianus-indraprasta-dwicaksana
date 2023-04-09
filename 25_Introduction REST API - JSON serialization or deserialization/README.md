
# (25) Introduction REST API - JSON serialization/deserialization



## Summary

REST API merupakan singkatan dari Representational State Transfer Application Programming Interface, dengan menggunakan REST API kita dapat memisahkan tampilan dengan proses bisnis, tampilan dan proses bisnis saling mengirim data melalui HTTP request.

HTTP merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data berbentuk media web. Proses komunikasi antara client dengan server misalnya client mengirimkan request kepada server,setelah diterima oleh server, maka server akan mengirimklan response.


Struktur Request terdapat URL, METHOD(GET,POST,PUT,DELETE), Header, Body. Untuk Struktur Response terdiri dari status code, header, body. Dio merupakan package pada flutter yang memudahkan kita untuk mengimplementasikan REST API. 

JSON merupakan singkatan dari Javascript Object Notation,merupakan suatu cara penulisan data dan umumnya digunakan pada REST API. Kita bisa mengubah struktur data ke JSON dengan menggunakan jsonEncode yang disebut sebagai istilah Serialisasi JSON, lalu yang satunya Deserialisasi JSON dimana kita mengubah JSON ke dalam struktur data dengan menggunakan jsonDecode







