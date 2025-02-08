import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';

abstract interface class SearchRepo {
  Future<List<ItemEntity>?> search(String query);
}