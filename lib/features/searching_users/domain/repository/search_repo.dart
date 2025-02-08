import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';

abstract interface class SearchRepository {
  Future<List<ItemEntity>?> search(String query);
}
