import 'package:flutter/foundation.dart';
import 'package:shop_y_z/db/db_helper.dart';

import '../models/brand.dart';

class TelescopeProvider with ChangeNotifier {
  List<Brand> brandList = [];

  Future<void> addBrand(String name) {
    final brand = Brand(name: name);
    return DbHelper.addBrand(brand);
  }

  getAllBrands() {
    DbHelper.getAllBrands().listen((snapshot) {
      brandList = List.generate(snapshot.docs.length,
          (index) => Brand.fromMap(snapshot.docs[index].data()));
    });
    notifyListeners();
  }
}
