class ErrorModel {
  int? statusCode;
  String? message;
  Errors? errors;

  ErrorModel({this.statusCode, this.message, this.errors});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errors = json['errors'] != null
        ? new Errors.fromJson(json['errors'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  Map<String, List<String>>? fields;

  Errors({this.fields});

  Errors.fromJson(Map<String, dynamic> json) {
    fields = {};
    json.forEach((key, value) {
      if (value is List) {
        fields![key] = List<String>.from(value);
      }
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.fields != null) {
      data.addAll(this.fields!);
    }
    return data;
  }
}
