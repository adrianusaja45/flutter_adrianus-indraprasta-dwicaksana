/* 3. Buatlah sebuah program untuk melakukan perhitungan bilangan faktorial secara asinkron.

    **********Sampel Input:********** `5`

    ****Sampel Output:**** `120` */

import 'dart:io';

Future<void> fakt() async {
  double faktorial = 1;
  print("Input angka yang merupakan bilangan bulat : ");
  int? x = int.parse(stdin.readLineSync()!);

  await Future.delayed(Duration(seconds: 5),(){

    if (x < 0){
      print("Angka yang dimasukkan bukan bilangan bulat");
    } else {
      for (int i = 1; i <= x; i++){
        faktorial *= i;
      }
      print("Hasil faktorial dari $x! adalah $faktorial");
    }
  });
}

void main() async {
  await fakt();
}