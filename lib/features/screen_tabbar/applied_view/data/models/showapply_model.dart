class ShowApplayModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  String? cvFile;
  String? otherFile;
  int? jobsId;
  int? userId;
  int? reviewed;
  dynamic accept;
  String? createdAt;
  String? updatedAt;

  ShowApplayModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.workType,
    this.cvFile,
    this.otherFile,
    this.jobsId,
    this.userId,
    this.reviewed,
    this.accept,
    this.createdAt,
    this.updatedAt,
  });

  ShowApplayModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    workType = json['work_type'];
    cvFile = json['cv_file'];
    otherFile = json['other_file'];
    jobsId = int.tryParse(json['jobs_id']?.toString() ?? '');
    userId = int.tryParse(json['user_id']?.toString() ?? '');
    reviewed = int.tryParse(json['reviewed']?.toString() ?? '');
    accept = json['accept'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['work_type'] = this.workType;
    data['cv_file'] = this.cvFile;
    data['other_file'] = this.otherFile;
    data['jobs_id'] = this.jobsId;
    data['user_id'] = this.userId;
    data['reviewed'] = this.reviewed;
    data['accept'] = this.accept;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
