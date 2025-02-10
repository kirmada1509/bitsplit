import 'package:bitsplit/features/user_grouping/api/get_apis/get_users/get_users_data_source.dart';
import 'package:bitsplit/features/user_grouping/models/get_users_user_model.dart';

class GetUsersRepo {
  final GetUsersDataSource getUsersDataSource;
  GetUsersRepo({required this.getUsersDataSource});

  Future<List<GetUsersUserModel>> getUsers(String query) async {
    return getUsersDataSource.getUsers(query);
  }
}
