
class Arijitsinghhitsmodel {
  List<Data>? data;
  int? total;
  String? next;

  Arijitsinghhitsmodel({this.data, this.total, this.next});

  Arijitsinghhitsmodel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["total"] is int) {
      total = json["total"];
    }
    if(json["next"] is String) {
      next = json["next"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["next"] = next;
    return _data;
  }
}

class Data {
  int? id;
  bool? readable;
  String? title;
  String? titleShort;
  String? titleVersion;
  String? link;
  int? duration;
  int? rank;
  bool? explicitLyrics;
  int? explicitContentLyrics;
  int? explicitContentCover;
  String? preview;
  String? md5Image;
  Artist? artist;
  Album? album;
  String? type;

  Data({this.id, this.readable, this.title, this.titleShort, this.titleVersion, this.link, this.duration, this.rank, this.explicitLyrics, this.explicitContentLyrics, this.explicitContentCover, this.preview, this.md5Image, this.artist, this.album, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["readable"] is bool) {
      readable = json["readable"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["title_short"] is String) {
      titleShort = json["title_short"];
    }
    if(json["title_version"] is String) {
      titleVersion = json["title_version"];
    }
    if(json["link"] is String) {
      link = json["link"];
    }
    if(json["duration"] is int) {
      duration = json["duration"];
    }
    if(json["rank"] is int) {
      rank = json["rank"];
    }
    if(json["explicit_lyrics"] is bool) {
      explicitLyrics = json["explicit_lyrics"];
    }
    if(json["explicit_content_lyrics"] is int) {
      explicitContentLyrics = json["explicit_content_lyrics"];
    }
    if(json["explicit_content_cover"] is int) {
      explicitContentCover = json["explicit_content_cover"];
    }
    if(json["preview"] is String) {
      preview = json["preview"];
    }
    if(json["md5_image"] is String) {
      md5Image = json["md5_image"];
    }
    if(json["artist"] is Map) {
      artist = json["artist"] == null ? null : Artist.fromJson(json["artist"]);
    }
    if(json["album"] is Map) {
      album = json["album"] == null ? null : Album.fromJson(json["album"]);
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["readable"] = readable;
    _data["title"] = title;
    _data["title_short"] = titleShort;
    _data["title_version"] = titleVersion;
    _data["link"] = link;
    _data["duration"] = duration;
    _data["rank"] = rank;
    _data["explicit_lyrics"] = explicitLyrics;
    _data["explicit_content_lyrics"] = explicitContentLyrics;
    _data["explicit_content_cover"] = explicitContentCover;
    _data["preview"] = preview;
    _data["md5_image"] = md5Image;
    if(artist != null) {
      _data["artist"] = artist?.toJson();
    }
    if(album != null) {
      _data["album"] = album?.toJson();
    }
    _data["type"] = type;
    return _data;
  }
}

class Album {
  int? id;
  String? title;
  String? cover;
  String? coverSmall;
  String? coverMedium;
  String? coverBig;
  String? coverXl;
  String? md5Image;
  String? tracklist;
  String? type;

  Album({this.id, this.title, this.cover, this.coverSmall, this.coverMedium, this.coverBig, this.coverXl, this.md5Image, this.tracklist, this.type});

  Album.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["cover"] is String) {
      cover = json["cover"];
    }
    if(json["cover_small"] is String) {
      coverSmall = json["cover_small"];
    }
    if(json["cover_medium"] is String) {
      coverMedium = json["cover_medium"];
    }
    if(json["cover_big"] is String) {
      coverBig = json["cover_big"];
    }
    if(json["cover_xl"] is String) {
      coverXl = json["cover_xl"];
    }
    if(json["md5_image"] is String) {
      md5Image = json["md5_image"];
    }
    if(json["tracklist"] is String) {
      tracklist = json["tracklist"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["cover"] = cover;
    _data["cover_small"] = coverSmall;
    _data["cover_medium"] = coverMedium;
    _data["cover_big"] = coverBig;
    _data["cover_xl"] = coverXl;
    _data["md5_image"] = md5Image;
    _data["tracklist"] = tracklist;
    _data["type"] = type;
    return _data;
  }
}

class Artist {
  int? id;
  String? name;
  String? link;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  String? tracklist;
  String? type;

  Artist({this.id, this.name, this.link, this.picture, this.pictureSmall, this.pictureMedium, this.pictureBig, this.pictureXl, this.tracklist, this.type});

  Artist.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["link"] is String) {
      link = json["link"];
    }
    if(json["picture"] is String) {
      picture = json["picture"];
    }
    if(json["picture_small"] is String) {
      pictureSmall = json["picture_small"];
    }
    if(json["picture_medium"] is String) {
      pictureMedium = json["picture_medium"];
    }
    if(json["picture_big"] is String) {
      pictureBig = json["picture_big"];
    }
    if(json["picture_xl"] is String) {
      pictureXl = json["picture_xl"];
    }
    if(json["tracklist"] is String) {
      tracklist = json["tracklist"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["link"] = link;
    _data["picture"] = picture;
    _data["picture_small"] = pictureSmall;
    _data["picture_medium"] = pictureMedium;
    _data["picture_big"] = pictureBig;
    _data["picture_xl"] = pictureXl;
    _data["tracklist"] = tracklist;
    _data["type"] = type;
    return _data;
  }
}