import 'package:bitsplit/features/searching_users/data/data_sources/remote_data_source.dart';
import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';
import 'package:bitsplit/features/searching_users/domain/repository/search_repo.dart';

class SearchRepoImpl implements SearchRepo {

  final RemoteDataSource remoteDataSource;

  SearchRepoImpl({required this.remoteDataSource});

  @override
  Future<List<ItemEntity>?> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
