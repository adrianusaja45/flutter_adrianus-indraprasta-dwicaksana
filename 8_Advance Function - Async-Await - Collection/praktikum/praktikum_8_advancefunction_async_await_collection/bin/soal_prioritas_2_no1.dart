/*1. Buatlah sebuah list dengan spesifikasi berikut:
    1. Tiap elemen wajib berupa list juga
    2. tiap element wajib terdapat 2 data(sub-elemen)
    3. Buatlah sebuah map dengan menggunakan list tersebut */


    void main () {

      List<List<dynamic>> namaNim = [[2005328,'Adrian'],[2005329, 'Budi']];

      Map map = {
          for(var item in namaNim) 
            item[0] : item[1]
          } ;
      print(map);


    }