class Store {
  int? total;
  Params? params;
  List<Data>? data;

  Store({this.total, this.params, this.data});

  Store.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    params =
    json['params'] != null ? new Params.fromJson(json['params']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.params != null) {
      data['params'] = this.params!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Params {
  String? q;
  int? page;
  String? ll;
  String? hl;
  String? gl;

  Params({this.q, this.page, this.ll, this.hl, this.gl});

  Params.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    page = json['page'];
    ll = json['ll'];
    hl = json['hl'];
    gl = json['gl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['page'] = this.page;
    data['ll'] = this.ll;
    data['hl'] = this.hl;
    data['gl'] = this.gl;
    return data;
  }
}

class Data {
  String? name;
  String? fullAddress;
  String? street;
  String? municipality;
  String? categories;
  String? phone;
  String? phones;
  String? claimed;
  int? reviewCount;
  double? averageRating;
  String? reviewUrl;
  double? latitude;
  double? longitude;
  String? openingHours;
  String? featuredImage;
  String? googleMapsUrl;
  String? googleKnowledgeUrl;
  String? cid;
  String? kgmid;
  String? placeId;
  String? website;
  String? domain;

  Data(
      {this.name,
        this.fullAddress,
        this.street,
        this.municipality,
        this.categories,
        this.phone,
        this.phones,
        this.claimed,
        this.reviewCount,
        this.averageRating,
        this.reviewUrl,
        this.latitude,
        this.longitude,
        this.openingHours,
        this.featuredImage,
        this.googleMapsUrl,
        this.googleKnowledgeUrl,
        this.cid,
        this.kgmid,
        this.placeId,
        this.website,
        this.domain});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullAddress = json['full_address'];
    street = json['street'];
    municipality = json['municipality'];
    categories = json['categories'];
    phone = json['phone'];
    phones = json['phones'];
    claimed = json['claimed'];
    reviewCount = json['review_count'];
    averageRating = json['average_rating'];
    reviewUrl = json['review_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    openingHours = json['opening_hours'];
    featuredImage = json['featured_image'];
    googleMapsUrl = json['google_maps_url'];
    googleKnowledgeUrl = json['google_knowledge_url'];
    cid = json['cid'];
    kgmid = json['kgmid'];
    placeId = json['place_id'];
    website = json['website'];
    domain = json['domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_address'] = this.fullAddress;
    data['street'] = this.street;
    data['municipality'] = this.municipality;
    data['categories'] = this.categories;
    data['phone'] = this.phone;
    data['phones'] = this.phones;
    data['claimed'] = this.claimed;
    data['review_count'] = this.reviewCount;
    data['average_rating'] = this.averageRating;
    data['review_url'] = this.reviewUrl;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['opening_hours'] = this.openingHours;
    data['featured_image'] = this.featuredImage;
    data['google_maps_url'] = this.googleMapsUrl;
    data['google_knowledge_url'] = this.googleKnowledgeUrl;
    data['cid'] = this.cid;
    data['kgmid'] = this.kgmid;
    data['place_id'] = this.placeId;
    data['website'] = this.website;
    data['domain'] = this.domain;
    return data;
  }
}
