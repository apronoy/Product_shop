class UserModel {
  int? _id;
  String? _title;
  double? _price;
  String? _description;
  String? _category;
  String? _image;
  Rating? _rating;

  UserModel(
      {int? id,
      String? title,
      double? price,
      String? description,
      String? category,
      String? image,
      Rating? rating}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (price != null) {
      this._price = price;
    }
    if (description != null) {
      this._description = description;
    }
    if (category != null) {
      this._category = category;
    }
    if (image != null) {
      this._image = image;
    }
    if (rating != null) {
      this._rating = rating;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  double? get price => _price;
  set price(double? price) => _price = price;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get image => _image;
  set image(String? image) => _image = image;
  Rating? get rating => _rating;
  set rating(Rating? rating) => _rating = rating;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _category = json['category'];
    _image = json['image'];
    _rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['price'] = this._price;
    data['description'] = this._description;
    data['category'] = this._category;
    data['image'] = this._image;
    if (this._rating != null) {
      data['rating'] = this._rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? _rate;
  int? _count;

  Rating({double? rate, int? count}) {
    if (rate != null) {
      this._rate = rate;
    }
    if (count != null) {
      this._count = count;
    }
  }

  double? get rate => _rate;
  set rate(double? rate) => _rate = rate;
  int? get count => _count;
  set count(int? count) => _count = count;

  Rating.fromJson(Map<String, dynamic> json) {
    _rate = json['rate'];
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this._rate;
    data['count'] = this._count;
    return data;
  }
}
