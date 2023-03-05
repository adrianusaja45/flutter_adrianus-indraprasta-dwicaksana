import 'dart:io';

class Hewan {
  int berat = 0;
}

class Mobil {
  final int kapasitas = 100;

  List<Hewan> muatan = [];

  void tambahMuatan(Hewan hewan) {
    int sum = 0;
    muatan.add(hewan);

    for (int i = 0; i < muatan.length; i++) {

      sum += muatan[i].berat;

    }
    for (int j = 0; j < muatan.length; j++) {
      var beratMuatan = muatan[j].berat;
      print(beratMuatan);
    }
    if (sum <= kapasitas) {

      print('total muatan : $sum kg');
    } else if (sum >= kapasitas) {
      print('Mobil Penuh');
    }
  }
}

void main() {
  var hewan1 = Hewan();
  var hewan2 = Hewan();
  var mobil = Mobil();
  print('Masukkan Berat Hewan');

  hewan1.berat = int.parse(stdin.readLineSync()!);
  hewan2.berat = int.parse(stdin.readLineSync()!);
  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);
}
