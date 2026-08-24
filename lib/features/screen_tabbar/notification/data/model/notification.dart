class NotificationModel {
  int? id;
  String? userId;
  String? compId;
  String? compName;
  String? userName;
  String? lastMassage;
  String? createdAt;
  String? updatedAt;

  NotificationModel({
    this.id,
    this.userId,
    this.compId,
    this.compName,
    this.userName,
    this.lastMassage,
    this.createdAt,
    this.updatedAt,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    compName = json['comp_name'];
    userName = json['user_name'];
    lastMassage = json['last_massage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['comp_id'] = this.compId;
    data['comp_name'] = this.compName;
    data['user_name'] = this.userName;
    data['last_massage'] = this.lastMassage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
