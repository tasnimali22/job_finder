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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cv_file'] = cvFile;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['work_type'] = workType;
    data['other_file'] = otherFile;
    data['jobs_id'] = jobsId;
    data['user_id'] = userId;
    data['reviewed'] = reviewed;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
