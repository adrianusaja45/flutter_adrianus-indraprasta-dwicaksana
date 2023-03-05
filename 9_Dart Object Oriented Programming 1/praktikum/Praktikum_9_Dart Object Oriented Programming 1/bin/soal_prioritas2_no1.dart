import 'dart:io';

class Calculator {
  int jumlah(a, b) {
    return a + b;
  }

  int kurang(a, b) {
    return a - b;
  }

  int kali(a, b) {
    return a * b;
  }

  double bagi(a, b) {
    return a / b;
  }
}

void main() {
  var calc = Calculator();

  print('Masukkan angka 1');
  String? a1 = stdin.readLineSync();
  int a = int.parse(a1!);
  print('Masukan angka 2');
  String? b1 = stdin.readLineSync();
  int b = int.parse(b1!);

  print('Penjumlahan');

  int jumlah = calc.jumlah(a, b);

  print('jumlah dari $a + $b = $jumlah');

  print('Pengurangan');

  int kurang = calc.kurang(a, b);
  print('pengurangan dari $a - $b = $kurang');

  print('Perkalian');

  int kali = calc.kali(a, b);
  print('hasil kali dari $a * $b = $kali');

  print('Pembagian');

  double bagi = calc.bagi(a, b);
  print('hasil bagi dari $a / $b = $bagi');
}
