

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:flutter_course/app/home/Models/product.dart';
class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Future<void> setData({String path, Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path : $data');
    await reference.set(data);
  }

  Future<void> set({String path, String data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path : $data');
    await reference.set({"name": FieldValue.arrayUnion([data])});
  }
  Future<void> updateData({String path, List<String> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path : $data');
    await reference.update({"name": FieldValue.arrayUnion(data)});
  }
  Future<void> removeData({String path, List<String> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path : $data');
    await reference.update({"name": FieldValue.arrayRemove(data)});
  }

  Future<void> createUser({String path, List<String> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path : $data');
    await reference.set({"name": FieldValue.arrayUnion(data)});
  }
  Future<void> deleteData({String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    //print('$path : $id');
    await reference.delete();
  }


  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data,String documentID),
  }) {
    print("${uid}");
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data() , snapshot.id)).toList());
  }
  Stream<List<T>> jobStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
  }) {
    print("${uid}");
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data())).toList());
  }
  Stream<List<T>> shopThreadStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
  }) {
    print("${uid}");
    final reference = FirebaseFirestore.instance.collection(path).where("threads" ,isEqualTo: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data())).toList());
  }

  Stream<List<T>> shopSparepartsStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
  }) {
    print("${uid}");
    final reference = FirebaseFirestore.instance.collection(path).where("spareparts" ,isEqualTo: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data())).toList());
  }

  Stream<List<T>> myProductStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data,String documentID),
  }) {
    print("${uid}");
    final reference = FirebaseFirestore.instance.collection(path).where(
        "id", isEqualTo: "${uid}");
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data(),snapshot.id)).toList());
  }

  Stream<List<T>> favoriteStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data,String documentID),
    @required List<String> list
  }) {
    print("${uid}");
    //arrayContainsAny:list
    final len = list.length;
    print("length : ${len}");
    //for (int i = 0; i<len; i++){
      final reference = FirebaseFirestore.instance.collection(path).where(
          'name', whereIn: list);
    print("${list} from my fav stream");
    final snapshots = reference.snapshots();
    //List<snapshot> s = [];
    return snapshots.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data(),snapshot.id)).toList());
  }
}
