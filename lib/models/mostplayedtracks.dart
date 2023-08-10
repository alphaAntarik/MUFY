class Mostplayedtracks {
  List<Tracks>? tracks;

  Mostplayedtracks({this.tracks});

  Mostplayedtracks.fromJson(Map<String, dynamic> json) {
    if (json["tracks"] is List) {
      tracks = json["tracks"] == null
          ? null
          : (json["tracks"] as List).map((e) => Tracks.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (tracks != null) {
      _data["tracks"] = tracks?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Tracks {
  Album? album;
  List<Artists1>? artists;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls3? externalUrls;
  String? id;
  bool? isLocal;
  bool? isPlayable;
  String? name;
  int? popularity;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  Tracks(
      {this.album,
      this.artists,
      this.discNumber,
      this.durationMs,
      this.explicit,
      this.externalIds,
      this.externalUrls,
      this.id,
      this.isLocal,
      this.isPlayable,
      this.name,
      this.popularity,
      this.previewUrl,
      this.trackNumber,
      this.type,
      this.uri});

  Tracks.fromJson(Map<String, dynamic> json) {
    if (json["album"] is Map) {
      album = json["album"] == null ? null : Album.fromJson(json["album"]);
    }
    if (json["artists"] is List) {
      artists = json["artists"] == null
          ? null
          : (json["artists"] as List).map((e) => Artists1.fromJson(e)).toList();
    }
    if (json["disc_number"] is int) {
      discNumber = json["disc_number"];
    }
    if (json["duration_ms"] is int) {
      durationMs = json["duration_ms"];
    }
    if (json["explicit"] is bool) {
      explicit = json["explicit"];
    }
    if (json["external_ids"] is Map) {
      externalIds = json["external_ids"] == null
          ? null
          : ExternalIds.fromJson(json["external_ids"]);
    }
    if (json["external_urls"] is Map) {
      externalUrls = json["external_urls"] == null
          ? null
          : ExternalUrls3.fromJson(json["external_urls"]);
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["is_local"] is bool) {
      isLocal = json["is_local"];
    }
    if (json["is_playable"] is bool) {
      isPlayable = json["is_playable"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["popularity"] is int) {
      popularity = json["popularity"];
    }
    if (json["preview_url"] is String) {
      previewUrl = json["preview_url"];
    }
    if (json["track_number"] is int) {
      trackNumber = json["track_number"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["uri"] is String) {
      uri = json["uri"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (album != null) {
      _data["album"] = album?.toJson();
    }
    if (artists != null) {
      _data["artists"] = artists?.map((e) => e.toJson()).toList();
    }
    _data["disc_number"] = discNumber;
    _data["duration_ms"] = durationMs;
    _data["explicit"] = explicit;
    if (externalIds != null) {
      _data["external_ids"] = externalIds?.toJson();
    }
    if (externalUrls != null) {
      _data["external_urls"] = externalUrls?.toJson();
    }
    _data["id"] = id;
    _data["is_local"] = isLocal;
    _data["is_playable"] = isPlayable;
    _data["name"] = name;
    _data["popularity"] = popularity;
    _data["preview_url"] = previewUrl;
    _data["track_number"] = trackNumber;
    _data["type"] = type;
    _data["uri"] = uri;
    return _data;
  }
}

class ExternalUrls3 {
  String? spotify;

  ExternalUrls3({this.spotify});

  ExternalUrls3.fromJson(Map<String, dynamic> json) {
    if (json["spotify"] is String) {
      spotify = json["spotify"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["spotify"] = spotify;
    return _data;
  }
}

class ExternalIds {
  String? isrc;

  ExternalIds({this.isrc});

  ExternalIds.fromJson(Map<String, dynamic> json) {
    if (json["isrc"] is String) {
      isrc = json["isrc"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isrc"] = isrc;
    return _data;
  }
}

class Artists1 {
  ExternalUrls2? externalUrls;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists1({this.externalUrls, this.id, this.name, this.type, this.uri});

  Artists1.fromJson(Map<String, dynamic> json) {
    if (json["external_urls"] is Map) {
      externalUrls = json["external_urls"] == null
          ? null
          : ExternalUrls2.fromJson(json["external_urls"]);
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["uri"] is String) {
      uri = json["uri"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (externalUrls != null) {
      _data["external_urls"] = externalUrls?.toJson();
    }
    _data["id"] = id;
    _data["name"] = name;
    _data["type"] = type;
    _data["uri"] = uri;
    return _data;
  }
}

class ExternalUrls2 {
  String? spotify;

  ExternalUrls2({this.spotify});

  ExternalUrls2.fromJson(Map<String, dynamic> json) {
    if (json["spotify"] is String) {
      spotify = json["spotify"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["spotify"] = spotify;
    return _data;
  }
}

class Album {
  String? albumType;
  List<Artists>? artists;
  ExternalUrls1? externalUrls;
  String? id;
  List<Images>? images;
  bool? isPlayable;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  Album(
      {this.albumType,
      this.artists,
      this.externalUrls,
      this.id,
      this.images,
      this.isPlayable,
      this.name,
      this.releaseDate,
      this.releaseDatePrecision,
      this.totalTracks,
      this.type,
      this.uri});

  Album.fromJson(Map<String, dynamic> json) {
    if (json["album_type"] is String) {
      albumType = json["album_type"];
    }
    if (json["artists"] is List) {
      artists = json["artists"] == null
          ? null
          : (json["artists"] as List).map((e) => Artists.fromJson(e)).toList();
    }
    if (json["external_urls"] is Map) {
      externalUrls = json["external_urls"] == null
          ? null
          : ExternalUrls1.fromJson(json["external_urls"]);
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["images"] is List) {
      images = json["images"] == null
          ? null
          : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    }
    if (json["is_playable"] is bool) {
      isPlayable = json["is_playable"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["release_date_precision"] is String) {
      releaseDatePrecision = json["release_date_precision"];
    }
    if (json["total_tracks"] is int) {
      totalTracks = json["total_tracks"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["uri"] is String) {
      uri = json["uri"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["album_type"] = albumType;
    if (artists != null) {
      _data["artists"] = artists?.map((e) => e.toJson()).toList();
    }
    if (externalUrls != null) {
      _data["external_urls"] = externalUrls?.toJson();
    }
    _data["id"] = id;
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    _data["is_playable"] = isPlayable;
    _data["name"] = name;
    _data["release_date"] = releaseDate;
    _data["release_date_precision"] = releaseDatePrecision;
    _data["total_tracks"] = totalTracks;
    _data["type"] = type;
    _data["uri"] = uri;
    return _data;
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["height"] = height;
    _data["url"] = url;
    _data["width"] = width;
    return _data;
  }
}

class ExternalUrls1 {
  String? spotify;

  ExternalUrls1({this.spotify});

  ExternalUrls1.fromJson(Map<String, dynamic> json) {
    if (json["spotify"] is String) {
      spotify = json["spotify"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["spotify"] = spotify;
    return _data;
  }
}

class Artists {
  ExternalUrls? externalUrls;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists({this.externalUrls, this.id, this.name, this.type, this.uri});

  Artists.fromJson(Map<String, dynamic> json) {
    if (json["external_urls"] is Map) {
      externalUrls = json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]);
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["uri"] is String) {
      uri = json["uri"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (externalUrls != null) {
      _data["external_urls"] = externalUrls?.toJson();
    }
    _data["id"] = id;
    _data["name"] = name;
    _data["type"] = type;
    _data["uri"] = uri;
    return _data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    if (json["spotify"] is String) {
      spotify = json["spotify"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["spotify"] = spotify;
    return _data;
  }
}
