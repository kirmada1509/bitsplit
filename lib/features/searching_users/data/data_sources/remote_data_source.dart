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
      url = 'https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow';
    } else {
      url = 'https://api.stackexchange.com/2.3/search?order=desc&sort=activity&intitle=$query&site=stackoverflow';
    }

    final response = await dio.get(url);
    final questions = jsonDecode(response.body);

    return questions['items'].map((question) => question['title']).toList();
  }
}
