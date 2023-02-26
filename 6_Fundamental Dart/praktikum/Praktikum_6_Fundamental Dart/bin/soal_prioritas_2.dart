void main(){
//   1. Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan
//   3 variabel tersebut dan tampilkan pada layar.
String nama = 'Adrianus Indraprasta Dwicaksana',
      universitas = 'Universitas Pendidikan Indonesia',
      jurusan = 'Rekayasa Perangkat Lunak';
      

print('Halo Semuanya, nama saya $nama, saya berasal dari $universitas jurusan '
    '$jurusan ');

// 2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan
// Bahasa Dart.
int diameter = 48, tinggi = 8;
double jariJari = diameter/2,pi = 3.14;

var volume = pi * jariJari * jariJari * tinggi;
print('Volume dari tabung(silinder) yaitu: $volume'); 
}