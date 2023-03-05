/* 2. Buatlah sebuah program untuk menghitung 
rata-rata dari sekumpulan nilai. Lakukan pembulatan
 keatas untuk nilai hasil perhitungan rata-rata.

Sampel Input:*`[7,5,3,5,2,1]`

Sampel Output: `4` */
import 'dart:io';
import 'dart:math';
void main(){

  List listAngka = [];
  stdout.write('Masukkan jumlah angka yang ingin dimasukkan \n');
  String? jumlahAngka = stdin.readLineSync();
  int jumlah = int.parse(jumlahAngka!);

  stdout.write('Masukkan Angka \n');
  for(var i = 0; i < jumlah; i++){
    String? angka = stdin.readLineSync();
  int input = int.parse(angka!);

    listAngka.add(input);
  }


  print(listAngka);
double sum =0;
  for (var j = 0; j < listAngka.length;j++){
    
    sum += listAngka[j];
  }

  
  var average = sum / listAngka.length;
  var finalAvg = average.round();
  print('avg : $finalAvg');



}