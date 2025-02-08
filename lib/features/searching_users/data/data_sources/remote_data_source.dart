import 'package:bitsplit/features/searching_users/data/models/item_model.dart';
import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';
import 'package:dio/dio.dart';

abstract interface class RemoteDataSource {
  Future<List<ItemEntity>?> search(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<ItemEntity>?> search(String query) async {
    final dio = Dio();

    String url;

    if (query.isEmpty) {
      url =
          'https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow';
    } else {
      url =
          'https://api.stackexchange.com/2.3/search?order=desc&sort=activity&intitle=$query&site=stackoverflow';
    }

    final response = await dio.get(url);
    List<ItemEntity> questions = [];
    for (dynamic item in response.data["items"]) {
      questions.add(ItemModel.fromJson(item));
    }

    return questions;
  }
}
