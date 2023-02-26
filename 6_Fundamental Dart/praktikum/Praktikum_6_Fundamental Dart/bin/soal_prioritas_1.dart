
void main(){
  // 1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan
  // menggunakan bahasa pemrograman Dart
  //keliling & Luas Persegi
  int sisiPersegi = 4;

  var kelilingPersegi = sisiPersegi + sisiPersegi + sisiPersegi + sisiPersegi;

  print('Keliling Persegi yaitu : $kelilingPersegi');

  var luasPersegi = sisiPersegi * sisiPersegi;

  print('Luas Persegi yaitu : $luasPersegi');

  //keliling & Luas persegi panjang
  int panjang = 8, lebar = 4;
  
  var kelilingPersegiPanjang = 2 * (panjang + lebar);

  print('Keliling Persegi Panjang Yaitu : $kelilingPersegiPanjang');

  var luasPersegiPanjang = panjang * lebar;

  print('Luas Persegi Panjang yaitu : $luasPersegiPanjang');

  // 2. Implementasikan rumus keliling dan luas dari Lingkaran dengan
  // menggunakan Bahasa Dart
  int diameter = 48;

  double jariJari = diameter / 2, pi = 22/7;
  
  var kelilingLingkaran = pi * diameter;

  print('Keliling Lingkaran yaitu : $kelilingLingkaran');

  var luasLingkaran = pi * jariJari * jariJari;

  print('Luas Lingkaran yaiut : $luasLingkaran');

}





