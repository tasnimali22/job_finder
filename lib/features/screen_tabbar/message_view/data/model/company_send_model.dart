class CompanySendMessageModel {
  String? massage;
  String? userId;
  String? compId;
  String? senderUser;
  String? updatedAt;
  String? createdAt;
  int? id;

  CompanySendMessageModel({
    this.massage,
    this.userId,
    this.compId,
    this.senderUser,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  CompanySendMessageModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    userId = json['user_id'];
    compId = json['comp_id'];
    senderUser = json['sender_user'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['user_id'] = this.userId;
    data['comp_id'] = this.compId;
    data['sender_user'] = this.senderUser;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
