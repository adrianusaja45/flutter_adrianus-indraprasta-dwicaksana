import 'dart:io';

void main(){
/*Soal Eksplorasi (20)
1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah
palindrom atau bukan.

Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara
baca atau susunan yang sama persis.
  */
    print( "Masukkan Kata yang diinginkan : ");
    String? kalimat= stdin.readLineSync();
    int n, i;
    bool palindrome = true;
    n = kalimat!.length;
    print(kalimat.length);
    for(i = 0; i < n; i++){
        if(kalimat[i] != kalimat[n-i-1])
        {
            palindrome = false;
            break;
        }
    }

    print( "Result : ");
    if(palindrome == true) {
      print( "Palindrom");
    } else {
      print( "Bukan Palindrom");
    }

    print('==========================================================');
    //2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang
    // dimasukkan.



        print("Input angka yang merupakan bilangan bulat : ");
        int? bilanganBulat = int.parse(stdin.readLineSync()!);
        if (bilanganBulat < 0){
            print("Angka yang dimasukkan bukan bilangan bulat");
        } else {
            print("Faktor dari $bilanganBulat adalah : ");
            for (int i = 1; i <= bilanganBulat; i++){
                if(bilanganBulat %i == 0){
                    stdout.write('$i ');
                }
            }

        }

    

}