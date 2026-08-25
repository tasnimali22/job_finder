class GetMessageModel {
  int? id;
  String? massage;
  int? userId;
  int? compId;
  String? senderUser;
  String? createdAt;
  String? updatedAt;

  GetMessageModel({
    this.id,
    this.massage,
    this.userId,
    this.compId,
    this.senderUser,
    this.createdAt,
    this.updatedAt,
  });

  GetMessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    massage = json['massage'];
    userId = json['user_id'];
    compId = json['comp_id'];
    senderUser = json['sender_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['massage'] = massage;
    data['user_id'] = userId;
    data['comp_id'] = compId;
    data['sender_user'] = senderUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
