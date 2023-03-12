class BangunRuang{
    int? panjang;
    int? lebar;
    int? tinggi;
    
    BangunRuang(this.panjang, this.lebar, this.tinggi);
    volume(){}
}

class Kubus extends BangunRuang{

    int? sisi;

    Kubus(this.sisi) : super(sisi, sisi, sisi);
    @override
    int volume() {
    // TODO: implement volume
    return sisi!*sisi!*sisi!;
  }
}

class Balok extends BangunRuang{
  
  

  Balok(panjang, lebar, tinggi) : super(panjang, lebar, tinggi);

  @override
  volume() {
    // TODO: implement volume
    return panjang!*lebar!*tinggi!;

  }
}

void main(){
  BangunRuang bangun = BangunRuang(0,0,0);

  bangun = Kubus(4); 
  print(bangun.volume());

  bangun = Balok(3,4,2);
  print(bangun.volume());
}