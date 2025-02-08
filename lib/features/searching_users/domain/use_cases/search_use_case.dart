import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';
import 'package:bitsplit/features/searching_users/domain/repository/search_repo.dart';

class SearchUseCase {
  final SearchRepository searchRepository;
  SearchUseCase({required this.searchRepository});

  Future<List<ItemEntity>?> call(String query) {
    return searchRepository.search(query);
  }
}
