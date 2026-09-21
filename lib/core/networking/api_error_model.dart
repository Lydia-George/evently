class ApiErrorModel {
  Fault? fault;

  ApiErrorModel({this.fault});

  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    fault = json['fault'] != null
        ? Fault.fromJson(json['fault'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (fault != null) {
      data['fault'] = fault!.toJson();
    }
    return data;
  }
}

class Fault {
  String? faultstring;
  Detail? detail;

  Fault({
    this.faultstring,
    this.detail,
  });

  Fault.fromJson(Map<String, dynamic> json) {
    faultstring = json['faultstring'];
    detail = json['detail'] != null
        ? Detail.fromJson(json['detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['faultstring'] = faultstring;

    if (detail != null) {
      data['detail'] = detail!.toJson();
    }

    return data;
  }
}

class Detail {
  String? errorcode;

  Detail({this.errorcode});

  Detail.fromJson(Map<String, dynamic> json) {
    errorcode = json['errorcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['errorcode'] = errorcode;
    return data;
  }
}