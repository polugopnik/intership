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
  List<Map<String, dynamic>> getExp(
      List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> results = [];
    for (var product in products) {
      if (product['price'] > 1000) {
        results.add(product);
      }
    }
    return results;
  }
 print(getExp(products));

  List<Map<String, dynamic>> getInS(
      List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> results = [];
    for (var product in products) {
      if (product['inStock'] == true) {
        results.add(product);
      }
    }
    return results;
  }
  print(getInS(products));

  List<Map<String, dynamic>> Alphabet(
      List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> results = [...products];
    results.sort((a, b) => a['name'].compareTo(b['name']));
    return results;
  }
  print(Alphabet(products));
}