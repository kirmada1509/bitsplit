import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required List<String> tags,
    required OwnerModel owner,
    required bool isAnswered,
    required int viewCount,
    required int answerCount,
    required int score,
    required int lastActivityDate,
    required int creationDate,
    required int questionId,
    required String contentLicense,
    required String link,
    required String title,
  }) : super(
          tags: tags,
          owner: owner,
          isAnswered: isAnswered,
          viewCount: viewCount,
          answerCount: answerCount,
          score: score,
          lastActivityDate: lastActivityDate,
          creationDate: creationDate,
          questionId: questionId,
          contentLicense: contentLicense,
          link: link,
          title: title,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      tags: List<String>.from(json['tags']),
      owner: OwnerModel.fromJson(json['owner']),
      isAnswered: json['isAnswered'],
      viewCount: json['viewCount'],
      answerCount: json['answerCount'],
      score: json['score'],
      lastActivityDate: json['lastActivityDate'],
      creationDate: json['creationDate'],
      questionId: json['questionId'],
      contentLicense: json['contentLicense'],
      link: json['link'],
      title: json['title'],
    );
  }
}

class OwnerModel extends OwnerEntity {
  OwnerModel(
      {required super.accountId,
      required super.reputation,
      required super.userId,
      required super.userType,
      required super.profileImage,
      required super.displayName,
      required super.link});

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      accountId: json['accountId'],
      reputation: json['reputation'],
      userId: json['userId'],
      userType: json['userType'],
      profileImage: json['profileImage'],
      displayName: json['displayName'],
      link: json['link'],
    );
  }

}
