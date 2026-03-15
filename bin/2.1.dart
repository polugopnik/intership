import 'dart:io';

void main() {
  List<Map<String, dynamic>> products = [
    {
      'id' : 1,
      'name' : 'Phone',
      'price' : 15000.0,
      'inStock' : true,
    },
    { 'id' : 2,
      'name' : 'Mikrovolnovka',
      'price' : 5000.0,
      'inStock' : false,
    },
    { 'id' : 3,
      'name' : 'Batareika',
      'price' : 100.0,
      'inStock' : true,
    },
    { 'id' : 4,
      'name' : 'Snus',
      'price' : 500.0,
      'inStock' : false,
    },
    { 'id' : 5,
      'name' : 'Botinok',
      'price' : 2000.0,
      'inStock' : true,
    },
  ];
var kosarBolshe = products.where((product){
 return product ['price'] > 1000;
}).toList();
print(kosarBolshe);
var naSklade = products.where ((product){
  return product ['inStock'] == true;
}).toList();
print(naSklade);
var sorted = List<Map<String, dynamic>>.from(products);
sorted.sort((a,b){
  return a['name'].compareTo(b['name']);
});
print(sorted);
}