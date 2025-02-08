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
      tags: List<String>.from(json['tags'] ?? []),
      owner: OwnerModel.fromJson(json['owner']),
      isAnswered: json['isAnswered'] ?? false,
      viewCount: json['viewCount'] ?? 0,
      answerCount: json['answerCount'] ?? 0,
      score: json['score'] ?? 0,
      lastActivityDate: json['lastActivityDate'] ?? 0,
      creationDate: json['creationDate'] ?? 0,
      questionId: json['questionId'] ?? 0,
      contentLicense: json['contentLicense'] ?? '',
      link: json['link'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tags": tags,
      "owner": (owner as OwnerModel).toJson(),
      "isAnswered": isAnswered,
      "viewCount": viewCount,
      "answerCount": answerCount,
      "score": score,
      "lastActivityDate": lastActivityDate,
      "creationDate": creationDate,
      "questionId": questionId,
      "contentLicense": contentLicense,
      "link": link,
      "title": title,
    };
  }
}

class OwnerModel extends OwnerEntity {
  OwnerModel({
    required int accountId,
    required int reputation,
    required int userId,
    required String userType,
    required String profileImage,
    required String displayName,
    required String link,
  }) : super(
          accountId: accountId,
          reputation: reputation,
          userId: userId,
          userType: userType,
          profileImage: profileImage,
          displayName: displayName,
          link: link,
        );

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      accountId: json['accountId'] ?? 0,
      reputation: json['reputation'] ?? 0,
      userId: json['userId'] ?? 0,
      userType: json['userType'] ?? '',
      profileImage: json['profileImage'] ?? '',
      displayName: json['displayName'] ?? '',
      link: json['link'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accountId": accountId,
      "reputation": reputation,
      "userId": userId,
      "userType": userType,
      "profileImage": profileImage,
      "displayName": displayName,
      "link": link,
    };
  }
}
