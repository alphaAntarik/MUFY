
class Internationalsongplaylistmodel {
  String? query;
  Playlists? playlists;

  Internationalsongplaylistmodel({this.query, this.playlists});

  Internationalsongplaylistmodel.fromJson(Map<String, dynamic> json) {
    if(json["query"] is String) {
      query = json["query"];
    }
    if(json["playlists"] is Map) {
      playlists = json["playlists"] == null ? null : Playlists.fromJson(json["playlists"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["query"] = query;
    if(playlists != null) {
      _data["playlists"] = playlists?.toJson();
    }
    return _data;
  }
}

class Playlists {
  int? totalCount;
  List<Items>? items;
  PagingInfo? pagingInfo;

  Playlists({this.totalCount, this.items, this.pagingInfo});

  Playlists.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if(json["pagingInfo"] is Map) {
      pagingInfo = json["pagingInfo"] == null ? null : PagingInfo.fromJson(json["pagingInfo"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    if(pagingInfo != null) {
      _data["pagingInfo"] = pagingInfo?.toJson();
    }
    return _data;
  }
}

class PagingInfo {
  int? nextOffset;
  int? limit;

  PagingInfo({this.nextOffset, this.limit});

  PagingInfo.fromJson(Map<String, dynamic> json) {
    if(json["nextOffset"] is int) {
      nextOffset = json["nextOffset"];
    }
    if(json["limit"] is int) {
      limit = json["limit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["nextOffset"] = nextOffset;
    _data["limit"] = limit;
    return _data;
  }
}

class Items {
  Data? data;

  Items({this.data});

  Items.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? uri;
  String? name;
  String? description;
  Images? images;
  Owner? owner;

  Data({this.uri, this.name, this.description, this.images, this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["images"] is Map) {
      images = json["images"] == null ? null : Images.fromJson(json["images"]);
    }
    if(json["owner"] is Map) {
      owner = json["owner"] == null ? null : Owner.fromJson(json["owner"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["name"] = name;
    _data["description"] = description;
    if(images != null) {
      _data["images"] = images?.toJson();
    }
    if(owner != null) {
      _data["owner"] = owner?.toJson();
    }
    return _data;
  }
}

class Owner {
  String? name;

  Owner({this.name});

  Owner.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    return _data;
  }
}

class Images {
  List<Items1>? items;

  Images({this.items});

  Images.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items1.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items1 {
  List<Sources>? sources;

  Items1({this.sources});

  Items1.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(sources != null) {
      _data["sources"] = sources?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Sources {
  String? url;
  int? width;
  int? height;

  Sources({this.url, this.width, this.height});

  Sources.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["width"] is int) {
      width = json["width"];
    }
    if(json["height"] is int) {
      height = json["height"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["width"] = width;
    _data["height"] = height;
    return _data;
  }
}