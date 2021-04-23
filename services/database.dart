
import 'package:flutter/cupertino.dart';
import 'package:flutter_course/app/home/Models/cart.dart';
import 'package:flutter_course/app/home/Models/job.dart';
import 'package:flutter_course/app/home/Models/shop.dart';
import 'package:flutter_course/app/services/APIPath.dart';
import 'package:flutter_course/app/services/firestore_service.dart';

import 'package:flutter_course/app/home/Models/product.dart';
import 'package:provider/provider.dart';

abstract class Database{
  Future<void> createProduct(Product product);
  Future<void> createJob(Job job);
  Future<void> deleteProduct(String path);
  Stream<List<Product>> productStream();
  Stream<List<Job>> jobStream();
  Stream<List<Product>> myProduct();
  Stream<List<Product>> myFav(List l);
  Future<void> createShop(Shop shop );
  Stream<List<Shop>> shopThreadStream();
  Stream<List<Shop>> shopSparepartsStream();
}
String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
 class FirestoreDatabase implements Database{
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
  final _service = FirestoreService.instance;
  Future<void> createProduct(Product product ) async => await _service.setData(
        path: APIPath.pro(documentIdFromCurrentDate()),
        data: product.toMap(),
      );
  Future<void> deleteProduct(String path ) async => await _service.deleteData(
    path: path
  );

  Future<void> createJob(Job job ) async => await _service.setData(
    path: APIPath.jobpath(documentIdFromCurrentDate()),
    data: job.toMap(),
  );
  Future<void> createShop(Shop shop ) async => await _service.setData(
    path: APIPath.shoppath(documentIdFromCurrentDate()),
    data: shop.toMap(),
  );

/*
  Future<void> addFavorite(Fav fav)async => _service.updateData(
    path: APIPath.addToFavorite(uid),
    data: fav.
    //data: {'name' : product.name,}
  );
*/

  Stream<List<Product>> productStream() => _service.collectionStream(path: APIPath.pros(), builder: (data ,documentID) => Product.fromMap(data,documentID));
  Stream<List<Product>> myProduct() => _service.myProductStream(path: APIPath.pros(), builder: (data,documentID) => Product.fromMap(data,documentID));
  Stream<List<Product>> myFav(l) => _service.favoriteStream(path: APIPath.pros(),list: l,builder: (data,documentID) => Product.fromMap(data,documentID));
   Stream<List<Job>> jobStream() => _service.jobStream(path: APIPath.job(), builder: (data) => Job.fromMap(data));

   Stream<List<Shop>> shopThreadStream() => _service.shopThreadStream(path: APIPath.shop(), builder: (data) => Shop.fromMap(data));
   Stream<List<Shop>> shopSparepartsStream() => _service.shopSparepartsStream(path: APIPath.shop(), builder: (data) => Shop.fromMap(data));

 }
