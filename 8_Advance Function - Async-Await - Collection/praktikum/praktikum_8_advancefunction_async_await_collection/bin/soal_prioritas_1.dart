/* 1. Buatlah sebuah fungsi dengan spesifikasi berikut:
    1. Menerima 2 parameter, yaitu list data dan pengali
    2. Lakukan perulangan pada list data secara asynchronous
    3. Tiap perulangan, kalikan elemen list data dengan pengali
    4. Return list baru yang berisi hasil proses diatas */




Future<List> p1(List a, List b)  {
  return Future.delayed(Duration(seconds: 1),(){
    List hasil = [] ;
     for(int i = 0; i < a.length; i++){
    hasil.add( a[i]*b[i]);
  }
   return hasil;
  
  });
}

void main() async{
   
   var result = await p1([20,30,40,50],[1,2,3,4]);
   print(result);
}