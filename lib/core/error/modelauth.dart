class ErrorModel {
  int? statusCode;
  String? message;
  Errors? errors;

  ErrorModel({this.statusCode, this.message, this.errors});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.toJson();
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
    if (fields != null) {
      data.addAll(fields!);
    }
    return data;
  }
}
