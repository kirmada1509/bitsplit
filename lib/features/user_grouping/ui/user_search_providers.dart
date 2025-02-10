import 'package:bitsplit/features/user_grouping/api/get_apis/get_users/get_users_data_source.dart';
import 'package:bitsplit/features/user_grouping/api/get_apis/get_users/get_users_repo.dart';
import 'package:bitsplit/features/user_grouping/models/get_users_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUsersDataSourceProvider = Provider((ref) {
  return GetUsersDataSource();
});

final getUsersRepoProvider = Provider((ref) {
  return GetUsersRepo(getUsersDataSource: ref.read(getUsersDataSourceProvider));
});

final searchResultsProvider = StateProvider<List<GetUsersUserModel>>((ref) => []);
