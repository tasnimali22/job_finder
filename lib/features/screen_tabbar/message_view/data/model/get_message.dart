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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['massage'] = this.massage;
    data['user_id'] = this.userId;
    data['comp_id'] = this.compId;
    data['sender_user'] = this.senderUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
