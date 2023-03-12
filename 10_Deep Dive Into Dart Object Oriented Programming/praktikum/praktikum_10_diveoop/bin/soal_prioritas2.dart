abstract class Matematika{
  hasil(){}
}

class KelipatanPersekutuanTerkecil implements Matematika{

int x;
int y;

KelipatanPersekutuanTerkecil(this.x, this.y);


  @override
  hasil() {
    // TODO: implement hasil
    return (x*y) / gcd(x,y);
  }
  int gcd ( x, y){
      return x.gcd(y);
    }
}

class FaktorPersekutuanTerbesar implements Matematika{


int x;
int y;

FaktorPersekutuanTerbesar(this.x, this.y);
  
  @override
  hasil() {
    // TODO: implement hasil
     return x.gcd(y);
  }
}

void main(){
 Matematika operation = KelipatanPersekutuanTerkecil(10, 25);
 print(operation.hasil());
 operation = FaktorPersekutuanTerbesar(98, 56);
 print(operation.hasil());
}