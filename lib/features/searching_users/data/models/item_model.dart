import 'package:bitsplit/features/searching_users/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required super.tags,
    required OwnerModel super.owner,
    required super.isAnswered,
    required super.viewCount,
    required super.answerCount,
    required super.score,
    required super.lastActivityDate,
    required super.creationDate,
    required super.questionId,
    required super.contentLicense,
    required super.link,
    required super.title,
  });

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
    required super.accountId,
    required super.reputation,
    required super.userId,
    required super.userType,
    required super.profileImage,
    required super.displayName,
    required super.link,
  });

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
