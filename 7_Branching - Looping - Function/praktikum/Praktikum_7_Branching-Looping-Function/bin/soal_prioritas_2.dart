import 'dart:core';
import 'dart:io';



void main(){
  // Tugas Looping
  //1. Buatlah sebuah piramid bintang


    int i, j, k;
    print("Enter the number of rows: ");
    String? n = stdin.readLineSync();
    int nilai = int.parse(n!);
    for (i = 1; i <= nilai; i++) {
      for(j = i; j < nilai; j++ ){
        stdout.write('  ');
      }

      for(k = 1; k < (i*2); k++){
        stdout.write(' *');
      }
    stdout.writeln();

    }

    print('');
    print('==============================================');

    // 2.Buatlah sebuah jam pasir seperti pada gambar dibawah ini


    for (i = nilai  ; i > 1; i--) {
      for(j = nilai-i +1 ; j > 0 ; j--){
        stdout.write(' ');
      }
        for(k = 1; k < (i*2); k++ ){
          stdout.write('0');
        }
      stdout.writeln();
    }

    for (i = 1; i <= nilai; i++) {
      for(j = i; j <= nilai; j++ ){
        stdout.write(' ');
      }

      for(k = 1; k < (i*2); k++){
        stdout.write('0');
      }
      stdout.writeln();

    }
    print('=====================================================');
    //3.Tampilkan faktorial dari nilai nilai dibawah in:
  //a. 10
  //b. 40
  //c. 50

    double faktorial = 1;
    print("Input angka yang merupakan bilangan bulat : ");
    int? x = int.parse(stdin.readLineSync()!);
    if (x < 0){
      print("Angka yang dimasukkan bukan bilangan bulat");
    } else {
      for (int i = 1; i <= x; i++){
        faktorial *= i;
      }
      print("Hasil faktorial dari $x! adalah $faktorial");
    }



//## Tugas Function
//
// 1. Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran.
// kemudian function lingkaran tersebut dijalankan pada function main!
  print('=====================================================');
  print('Masukkan jari jari lingkaran : ');

  String? r = stdin.readLineSync();

  double jariJari = double.parse(r!);

  print('Hasil Luas Lingkaran yaitu : ');

 var luas =  luasLingkaran(jariJari);
 print(luas);

  }

double luasLingkaran(double jariJari){

double pi = 3.14;

  return   pi * jariJari * jariJari;
}
