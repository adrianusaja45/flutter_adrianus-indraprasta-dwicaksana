import 'dart:io';
import 'dart:math';

void main() {
  //Soal Eksplorasi
  //Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk bilangan prima atau bukan.

  int flag = 1;

  stdout.write('Enter a number : \n');

  String? num = stdin.readLineSync();
  int number = int.parse(num!);

  for (int i = 2; i <= number/2; i++) {
    if (number % i == 0) {
      flag = 0;
      break;
    }
  }

  if (number <= 1) {
    flag = 0;
  }

  if (flag == 1) {
    stdout.write('$number bilangan prima');
  } else {
    stdout.write('$number bukan bilangan prima');
  }

  stdout.write('\n');

  //Buatlah sebuah program untuk mencetak tabel perkalian.
  stdout.write('masukkan angka :');
  String? n = stdin.readLineSync();
  int nums = int.parse(n!);
  int i,j;
  stdout.write('Tabel Perkalian');
  stdout.write('\n');
  for(i = 1; i <= nums; i++){
    for(j = 1; j <= nums; j++){
      var kali = i*j;
      stdout.write('$kali \t');
    }
    stdout.write("\n");
  }


}
