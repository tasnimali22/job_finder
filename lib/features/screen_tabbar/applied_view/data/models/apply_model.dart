class ApplayModel {
  String? cvFile;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  String? otherFile;
  String? jobsId;
  String? userId;
  bool? reviewed;
  String? updatedAt;
  String? createdAt;
  int? id;

  ApplayModel({
    this.cvFile,
    this.name,
    this.email,
    this.mobile,
    this.workType,
    this.otherFile,
    this.jobsId,
    this.userId,
    this.reviewed,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  ApplayModel.fromJson(Map<String, dynamic> json) {
    cvFile = json['cv_file'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    workType = json['work_type'];
    otherFile = json['other_file'];
    jobsId = json['jobs_id'];
    userId = json['user_id'];
    reviewed = json['reviewed'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cv_file'] = this.cvFile;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['work_type'] = this.workType;
    data['other_file'] = this.otherFile;
    data['jobs_id'] = this.jobsId;
    data['user_id'] = this.userId;
    data['reviewed'] = this.reviewed;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
