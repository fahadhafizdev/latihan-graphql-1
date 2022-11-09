class CountriesModelResponse {
  List<CountriesModel>? countries;

  CountriesModelResponse({this.countries});

  CountriesModelResponse.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <CountriesModel>[];
      json['countries'].forEach((v) {
        countries!.add(new CountriesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountriesModel {
  String? name;
  String? code;

  CountriesModel({this.name, this.code});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
