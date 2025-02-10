import 'package:bitsplit/features/user_grouping/models/get_users_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUsersDataSource {
  final db = FirebaseFirestore.instance;

  Future<List<GetUsersUserModel>> getUsers(String query) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.collection("users").get();

      Map<String, dynamic> allAccounts = snapshot.docs[0].data();
      List<GetUsersUserModel> data = [];

      allAccounts.forEach((key, value) {
        if (key.toLowerCase().contains(query.toLowerCase())) {
          data.add(GetUsersUserModel(name: key, uid: value));
        }
      });
      return data;
    } catch (e) {
      print("Error fetching users: $e");
      return [];
    }
  }
}
