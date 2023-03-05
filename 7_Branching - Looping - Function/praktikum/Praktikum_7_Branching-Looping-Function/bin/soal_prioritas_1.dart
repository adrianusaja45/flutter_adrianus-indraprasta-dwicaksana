import 'dart:io';

void main(){
  // Tugas Percabangan(branching)
  /* 1. Terdapat sebuah nilai:
    1. jika nilai > 70 akan mereturn “Nilai A”
    2. jika nilai > 40 akan mereturn “Nilai B”
    3. jika nilai > 0 akan mereturn “Nilai C”
    4. selain itu return teks kosong
    */
  print('Masukkan Nilai :');
    String? n = stdin.readLineSync();
    int nilai = int.parse(n!);
    if(nilai > 70){
      print('Nilai A');
    }else if(nilai > 40){
      print('Nilai B');
    }else if(nilai>0){
      print('Nilai C');
    }else{
      print('');
    }
    print('==============================');
    //Tugas Perulangan(Looping)
    //tampilkan nilai 1 - 10 pada layar dengan menggunakan perulangan!

    for(int i = 1; i <= 10; i++ ){
      print(i);
    }
}
