void main(){

  List<int> num = [1,2,3,4,5];
  int sum = 0;
  for(int i=0;i<4;i++){
      sum += num[i];
  }
int kapasitas = 9;

if(sum < kapasitas){
  print('$sum');
    print('aman');
  } else {
    print('Mobil Penuh');
    print('$sum');
  }
  
}