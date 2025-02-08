import 'package:bitsplit/features/searching_users/data/data_sources/remote_data_source.dart';
import 'package:bitsplit/features/searching_users/data/repositories/search_repo_impl.dart';
import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';
import 'package:bitsplit/features/searching_users/domain/use_cases/search_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteDataSourceProvider = Provider((ref) {
  return RemoteDataSourceImpl();
});

final searchRepositoryProvider = Provider((ref) {
  return SearchRepoImpl(remoteDataSource: ref.read(remoteDataSourceProvider));
});

final searchUseCaseProvider = Provider((ref) {
  return SearchUseCase(searchRepository: ref.read(searchRepositoryProvider));
});

final itemsProvider =
    FutureProvider.family<List<ItemEntity>?, String>((ref, String query) async {
  return ref.read(searchUseCaseProvider).call(query);
});

final queryProvider = StateProvider<String>((ref) => "");
