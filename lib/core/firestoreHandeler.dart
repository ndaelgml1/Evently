import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/user.dart';

class Firestorehandeler {
  static CollectionReference<User> getUserCollection() {
    var collection = FirebaseFirestore.instance
        .collection("User")
        .withConverter(
          fromFirestore: (snapshot, options) {
            Map<String, dynamic>? data = snapshot.data();
            return User.fromFireStore(data);
          },
          toFirestore: (user, options) {
            return user.toFirestore();
          },
        );
    return collection;
  }

  static Future<void> addUser(User user) {
    var collection = getUserCollection();
    var document = collection.doc(user.id);
    return document.set(user);
  }

  static Future getUser(String userId) async {
    var collection = getUserCollection();
    var document = collection.doc(userId);
    var snapshot = await document.get();
    return snapshot.data();
  }
}
