class ItemEntity {
    List<String> tags;
    OwnerEntity owner;
    bool isAnswered;
    int viewCount;
    int answerCount;
    int score;
    int lastActivityDate;
    int creationDate;
    int questionId;
    String contentLicense;
    String link;
    String title;

    ItemEntity({
        required this.tags,
        required this.owner,
        required this.isAnswered,
        required this.viewCount,
        required this.answerCount,
        required this.score,
        required this.lastActivityDate,
        required this.creationDate,
        required this.questionId,
        required this.contentLicense,
        required this.link,
        required this.title,
    });

}

class OwnerEntity {
    int accountId;
    int reputation;
    int userId;
    String userType;
    String profileImage;
    String displayName;
    String link;

    OwnerEntity({
        required this.accountId,
        required this.reputation,
        required this.userId,
        required this.userType,
        required this.profileImage,
        required this.displayName,
        required this.link,
    });

}
