import 'package:bitsplit/features/user_grouping/models/get_users_user_model.dart';
import 'package:bitsplit/features/user_grouping/ui/user_search_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSearchPage extends ConsumerWidget {
  UserSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> search(String query) async {
      final repo = ref.read(getUsersRepoProvider);
      ref.read(searchResultsProvider.notifier).state = await repo.getUsers(query);
    }

    List<GetUsersUserModel> searchResults = ref.watch(searchResultsProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (query) async {
              search(query);
              searchResults.forEach((v) => print(v.name));
            },
          ),
          searchResults.length > 0
              ? SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(
                          searchResults[i].name,
                        ),
                      );
                    },
                    itemCount: searchResults.length,
                  ),
                )
              : Text("searh for somehign"),
        ],
      ),
    );
  }
}
