void main() {
  List brand = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];

  Map<String, dynamic> map = {};
  for (var i in brand.toSet().toList()) {
    var total = 0;
    for (var element in brand) {
      if (element.toLowerCase() == i.toLowerCase()) {
        total++;
      }
    }
    map[i] = total;
  }
  print(map.toString());
}
