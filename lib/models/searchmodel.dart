
class Searchmodel {
  Albums? albums;
  Artists1? artists;
  Episodes? episodes;
  Genres? genres;
  Playlists? playlists;
  Podcasts? podcasts;
  TopResults? topResults;
  Tracks? tracks;
  Users? users;

  Searchmodel({this.albums, this.artists, this.episodes, this.genres, this.playlists, this.podcasts, this.topResults, this.tracks, this.users});

  Searchmodel.fromJson(Map<String, dynamic> json) {
    if(json["albums"] is Map) {
      albums = json["albums"] == null ? null : Albums.fromJson(json["albums"]);
    }
    if(json["artists"] is Map) {
      artists = json["artists"] == null ? null : Artists1.fromJson(json["artists"]);
    }
    if(json["episodes"] is Map) {
      episodes = json["episodes"] == null ? null : Episodes.fromJson(json["episodes"]);
    }
    if(json["genres"] is Map) {
      genres = json["genres"] == null ? null : Genres.fromJson(json["genres"]);
    }
    if(json["playlists"] is Map) {
      playlists = json["playlists"] == null ? null : Playlists.fromJson(json["playlists"]);
    }
    if(json["podcasts"] is Map) {
      podcasts = json["podcasts"] == null ? null : Podcasts.fromJson(json["podcasts"]);
    }
    if(json["topResults"] is Map) {
      topResults = json["topResults"] == null ? null : TopResults.fromJson(json["topResults"]);
    }
    if(json["tracks"] is Map) {
      tracks = json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]);
    }
    if(json["users"] is Map) {
      users = json["users"] == null ? null : Users.fromJson(json["users"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(albums != null) {
      _data["albums"] = albums?.toJson();
    }
    if(artists != null) {
      _data["artists"] = artists?.toJson();
    }
    if(episodes != null) {
      _data["episodes"] = episodes?.toJson();
    }
    if(genres != null) {
      _data["genres"] = genres?.toJson();
    }
    if(playlists != null) {
      _data["playlists"] = playlists?.toJson();
    }
    if(podcasts != null) {
      _data["podcasts"] = podcasts?.toJson();
    }
    if(topResults != null) {
      _data["topResults"] = topResults?.toJson();
    }
    if(tracks != null) {
      _data["tracks"] = tracks?.toJson();
    }
    if(users != null) {
      _data["users"] = users?.toJson();
    }
    return _data;
  }
}

class Users {
  int? totalCount;
  List<Items11>? items;

  Users({this.totalCount, this.items});

  Users.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items11.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items11 {
  Data8? data;

  Items11({this.data});

  Items11.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data8.fromJson(json["data"]);
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

class Data8 {
  String? uri;
  String? id;
  String? displayName;
  String? username;
  Image? image;

  Data8({this.uri, this.id, this.displayName, this.username, this.image});

  Data8.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["displayName"] is String) {
      displayName = json["displayName"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["image"] is Map) {
      image = json["image"] == null ? null : Image.fromJson(json["image"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["id"] = id;
    _data["displayName"] = displayName;
    _data["username"] = username;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    return _data;
  }
}

class Image {
  dynamic smallImageUrl;
  dynamic largeImageUrl;

  Image({this.smallImageUrl, this.largeImageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json["smallImageUrl"];
    largeImageUrl = json["largeImageUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["smallImageUrl"] = smallImageUrl;
    _data["largeImageUrl"] = largeImageUrl;
    return _data;
  }
}

class Tracks {
  int? totalCount;
  List<Items9>? items;

  Tracks({this.totalCount, this.items});

  Tracks.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items9.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items9 {
  Data7? data;

  Items9({this.data});

  Items9.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data7.fromJson(json["data"]);
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

class Data7 {
  String? uri;
  String? id;
  String? name;
  AlbumOfTrack? albumOfTrack;
  Artists2? artists;
  ContentRating1? contentRating;
  Duration1? duration;
  Playability? playability;

  Data7({this.uri, this.id, this.name, this.albumOfTrack, this.artists, this.contentRating, this.duration, this.playability});

  Data7.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["albumOfTrack"] is Map) {
      albumOfTrack = json["albumOfTrack"] == null ? null : AlbumOfTrack.fromJson(json["albumOfTrack"]);
    }
    if(json["artists"] is Map) {
      artists = json["artists"] == null ? null : Artists2.fromJson(json["artists"]);
    }
    if(json["contentRating"] is Map) {
      contentRating = json["contentRating"] == null ? null : ContentRating1.fromJson(json["contentRating"]);
    }
    if(json["duration"] is Map) {
      duration = json["duration"] == null ? null : Duration1.fromJson(json["duration"]);
    }
    if(json["playability"] is Map) {
      playability = json["playability"] == null ? null : Playability.fromJson(json["playability"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["id"] = id;
    _data["name"] = name;
    if(albumOfTrack != null) {
      _data["albumOfTrack"] = albumOfTrack?.toJson();
    }
    if(artists != null) {
      _data["artists"] = artists?.toJson();
    }
    if(contentRating != null) {
      _data["contentRating"] = contentRating?.toJson();
    }
    if(duration != null) {
      _data["duration"] = duration?.toJson();
    }
    if(playability != null) {
      _data["playability"] = playability?.toJson();
    }
    return _data;
  }
}

class Playability {
  bool? playable;

  Playability({this.playable});

  Playability.fromJson(Map<String, dynamic> json) {
    if(json["playable"] is bool) {
      playable = json["playable"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["playable"] = playable;
    return _data;
  }
}

class Duration1 {
  int? totalMilliseconds;

  Duration1({this.totalMilliseconds});

  Duration1.fromJson(Map<String, dynamic> json) {
    if(json["totalMilliseconds"] is int) {
      totalMilliseconds = json["totalMilliseconds"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalMilliseconds"] = totalMilliseconds;
    return _data;
  }
}

class ContentRating1 {
  String? label;

  ContentRating1({this.label});

  ContentRating1.fromJson(Map<String, dynamic> json) {
    if(json["label"] is String) {
      label = json["label"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["label"] = label;
    return _data;
  }
}

class Artists2 {
  List<Items10>? items;

  Artists2({this.items});

  Artists2.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items10.fromJson(e)).toList();
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

class Items10 {
  String? uri;
  Profile3? profile;

  Items10({this.uri, this.profile});

  Items10.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["profile"] is Map) {
      profile = json["profile"] == null ? null : Profile3.fromJson(json["profile"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    if(profile != null) {
      _data["profile"] = profile?.toJson();
    }
    return _data;
  }
}

class Profile3 {
  String? name;

  Profile3({this.name});

  Profile3.fromJson(Map<String, dynamic> json) {
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

class AlbumOfTrack {
  String? uri;
  String? name;
  CoverArt4? coverArt;
  String? id;
  SharingInfo? sharingInfo;

  AlbumOfTrack({this.uri, this.name, this.coverArt, this.id, this.sharingInfo});

  AlbumOfTrack.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["coverArt"] is Map) {
      coverArt = json["coverArt"] == null ? null : CoverArt4.fromJson(json["coverArt"]);
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["sharingInfo"] is Map) {
      sharingInfo = json["sharingInfo"] == null ? null : SharingInfo.fromJson(json["sharingInfo"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["name"] = name;
    if(coverArt != null) {
      _data["coverArt"] = coverArt?.toJson();
    }
    _data["id"] = id;
    if(sharingInfo != null) {
      _data["sharingInfo"] = sharingInfo?.toJson();
    }
    return _data;
  }
}

class SharingInfo {
  String? shareUrl;

  SharingInfo({this.shareUrl});

  SharingInfo.fromJson(Map<String, dynamic> json) {
    if(json["shareUrl"] is String) {
      shareUrl = json["shareUrl"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["shareUrl"] = shareUrl;
    return _data;
  }
}

class CoverArt4 {
  List<Sources8>? sources;

  CoverArt4({this.sources});

  CoverArt4.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources8.fromJson(e)).toList();
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

class Sources8 {
  String? url;
  int? width;
  int? height;

  Sources8({this.url, this.width, this.height});

  Sources8.fromJson(Map<String, dynamic> json) {
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

class TopResults {
  List<Items7>? items;
  List<Featured>? featured;

  TopResults({this.items, this.featured});

  TopResults.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items7.fromJson(e)).toList();
    }
    if(json["featured"] is List) {
      featured = json["featured"] == null ? null : (json["featured"] as List).map((e) => Featured.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    if(featured != null) {
      _data["featured"] = featured?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Featured {
  Data6? data;

  Featured({this.data});

  Featured.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data6.fromJson(json["data"]);
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

class Data6 {
  String? uri;
  String? name;
  String? description;
  Images1? images;
  Owner1? owner;

  Data6({this.uri, this.name, this.description, this.images, this.owner});

  Data6.fromJson(Map<String, dynamic> json) {
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
      images = json["images"] == null ? null : Images1.fromJson(json["images"]);
    }
    if(json["owner"] is Map) {
      owner = json["owner"] == null ? null : Owner1.fromJson(json["owner"]);
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

class Owner1 {
  String? name;

  Owner1({this.name});

  Owner1.fromJson(Map<String, dynamic> json) {
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

class Images1 {
  List<Items8>? items;

  Images1({this.items});

  Images1.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items8.fromJson(e)).toList();
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

class Items8 {
  List<Sources7>? sources;

  Items8({this.sources});

  Items8.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources7.fromJson(e)).toList();
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

class Sources7 {
  String? url;
  dynamic width;
  dynamic height;

  Sources7({this.url, this.width, this.height});

  Sources7.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String) {
      url = json["url"];
    }
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["width"] = width;
    _data["height"] = height;
    return _data;
  }
}

class Items7 {
  Data5? data;

  Items7({this.data});

  Items7.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data5.fromJson(json["data"]);
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

class Data5 {
  String? uri;
  Profile2? profile;
  Visuals1? visuals;

  Data5({this.uri, this.profile, this.visuals});

  Data5.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["profile"] is Map) {
      profile = json["profile"] == null ? null : Profile2.fromJson(json["profile"]);
    }
    if(json["visuals"] is Map) {
      visuals = json["visuals"] == null ? null : Visuals1.fromJson(json["visuals"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    if(profile != null) {
      _data["profile"] = profile?.toJson();
    }
    if(visuals != null) {
      _data["visuals"] = visuals?.toJson();
    }
    return _data;
  }
}

class Visuals1 {
  AvatarImage1? avatarImage;

  Visuals1({this.avatarImage});

  Visuals1.fromJson(Map<String, dynamic> json) {
    if(json["avatarImage"] is Map) {
      avatarImage = json["avatarImage"] == null ? null : AvatarImage1.fromJson(json["avatarImage"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(avatarImage != null) {
      _data["avatarImage"] = avatarImage?.toJson();
    }
    return _data;
  }
}

class AvatarImage1 {
  List<Sources6>? sources;

  AvatarImage1({this.sources});

  AvatarImage1.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources6.fromJson(e)).toList();
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

class Sources6 {
  String? url;
  int? width;
  int? height;

  Sources6({this.url, this.width, this.height});

  Sources6.fromJson(Map<String, dynamic> json) {
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

class Profile2 {
  String? name;

  Profile2({this.name});

  Profile2.fromJson(Map<String, dynamic> json) {
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

class Podcasts {
  int? totalCount;
  List<Items6>? items;

  Podcasts({this.totalCount, this.items});

  Podcasts.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items6.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items6 {
  Data4? data;

  Items6({this.data});

  Items6.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data4.fromJson(json["data"]);
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

class Data4 {
  String? uri;
  String? name;
  CoverArt3? coverArt;
  String? type;
  Publisher? publisher;
  String? mediaType;

  Data4({this.uri, this.name, this.coverArt, this.type, this.publisher, this.mediaType});

  Data4.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["coverArt"] is Map) {
      coverArt = json["coverArt"] == null ? null : CoverArt3.fromJson(json["coverArt"]);
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["publisher"] is Map) {
      publisher = json["publisher"] == null ? null : Publisher.fromJson(json["publisher"]);
    }
    if(json["mediaType"] is String) {
      mediaType = json["mediaType"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["name"] = name;
    if(coverArt != null) {
      _data["coverArt"] = coverArt?.toJson();
    }
    _data["type"] = type;
    if(publisher != null) {
      _data["publisher"] = publisher?.toJson();
    }
    _data["mediaType"] = mediaType;
    return _data;
  }
}

class Publisher {
  String? name;

  Publisher({this.name});

  Publisher.fromJson(Map<String, dynamic> json) {
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

class CoverArt3 {
  List<Sources5>? sources;

  CoverArt3({this.sources});

  CoverArt3.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources5.fromJson(e)).toList();
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

class Sources5 {
  String? url;
  int? width;
  int? height;

  Sources5({this.url, this.width, this.height});

  Sources5.fromJson(Map<String, dynamic> json) {
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

class Playlists {
  int? totalCount;
  List<Items4>? items;

  Playlists({this.totalCount, this.items});

  Playlists.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items4.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items4 {
  Data3? data;

  Items4({this.data});

  Items4.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data3.fromJson(json["data"]);
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

class Data3 {
  String? uri;
  String? name;
  String? description;
  Images? images;
  Owner? owner;

  Data3({this.uri, this.name, this.description, this.images, this.owner});

  Data3.fromJson(Map<String, dynamic> json) {
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
  List<Items5>? items;

  Images({this.items});

  Images.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items5.fromJson(e)).toList();
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

class Items5 {
  List<Sources4>? sources;

  Items5({this.sources});

  Items5.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources4.fromJson(e)).toList();
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

class Sources4 {
  String? url;
  dynamic width;
  dynamic height;

  Sources4({this.url, this.width, this.height});

  Sources4.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String) {
      url = json["url"];
    }
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["width"] = width;
    _data["height"] = height;
    return _data;
  }
}

class Genres {
  int? totalCount;
  List<dynamic>? items;

  Genres({this.totalCount, this.items});

  Genres.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items;
    }
    return _data;
  }
}

class Episodes {
  int? totalCount;
  List<Items3>? items;

  Episodes({this.totalCount, this.items});

  Episodes.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items3.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items3 {
  Data2? data;

  Items3({this.data});

  Items3.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data2.fromJson(json["data"]);
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

class Data2 {
  String? uri;
  String? name;
  CoverArt1? coverArt;
  Duration? duration;
  ReleaseDate? releaseDate;
  Podcast? podcast;
  String? description;
  ContentRating? contentRating;

  Data2({this.uri, this.name, this.coverArt, this.duration, this.releaseDate, this.podcast, this.description, this.contentRating});

  Data2.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["coverArt"] is Map) {
      coverArt = json["coverArt"] == null ? null : CoverArt1.fromJson(json["coverArt"]);
    }
    if(json["duration"] is Map) {
      duration = json["duration"] == null ? null : Duration.fromJson(json["duration"]);
    }
    if(json["releaseDate"] is Map) {
      releaseDate = json["releaseDate"] == null ? null : ReleaseDate.fromJson(json["releaseDate"]);
    }
    if(json["podcast"] is Map) {
      podcast = json["podcast"] == null ? null : Podcast.fromJson(json["podcast"]);
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["contentRating"] is Map) {
      contentRating = json["contentRating"] == null ? null : ContentRating.fromJson(json["contentRating"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["name"] = name;
    if(coverArt != null) {
      _data["coverArt"] = coverArt?.toJson();
    }
    if(duration != null) {
      _data["duration"] = duration?.toJson();
    }
    if(releaseDate != null) {
      _data["releaseDate"] = releaseDate?.toJson();
    }
    if(podcast != null) {
      _data["podcast"] = podcast?.toJson();
    }
    _data["description"] = description;
    if(contentRating != null) {
      _data["contentRating"] = contentRating?.toJson();
    }
    return _data;
  }
}

class ContentRating {
  String? label;

  ContentRating({this.label});

  ContentRating.fromJson(Map<String, dynamic> json) {
    if(json["label"] is String) {
      label = json["label"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["label"] = label;
    return _data;
  }
}

class Podcast {
  CoverArt2? coverArt;

  Podcast({this.coverArt});

  Podcast.fromJson(Map<String, dynamic> json) {
    if(json["coverArt"] is Map) {
      coverArt = json["coverArt"] == null ? null : CoverArt2.fromJson(json["coverArt"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(coverArt != null) {
      _data["coverArt"] = coverArt?.toJson();
    }
    return _data;
  }
}

class CoverArt2 {
  List<Sources3>? sources;

  CoverArt2({this.sources});

  CoverArt2.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources3.fromJson(e)).toList();
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

class Sources3 {
  String? url;
  int? width;
  int? height;

  Sources3({this.url, this.width, this.height});

  Sources3.fromJson(Map<String, dynamic> json) {
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

class ReleaseDate {
  String? isoString;

  ReleaseDate({this.isoString});

  ReleaseDate.fromJson(Map<String, dynamic> json) {
    if(json["isoString"] is String) {
      isoString = json["isoString"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isoString"] = isoString;
    return _data;
  }
}

class Duration {
  int? totalMilliseconds;

  Duration({this.totalMilliseconds});

  Duration.fromJson(Map<String, dynamic> json) {
    if(json["totalMilliseconds"] is int) {
      totalMilliseconds = json["totalMilliseconds"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalMilliseconds"] = totalMilliseconds;
    return _data;
  }
}

class CoverArt1 {
  List<Sources2>? sources;

  CoverArt1({this.sources});

  CoverArt1.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources2.fromJson(e)).toList();
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

class Sources2 {
  String? url;
  int? width;
  int? height;

  Sources2({this.url, this.width, this.height});

  Sources2.fromJson(Map<String, dynamic> json) {
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

class Artists1 {
  int? totalCount;
  List<Items2>? items;

  Artists1({this.totalCount, this.items});

  Artists1.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items2.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items2 {
  Data1? data;

  Items2({this.data});

  Items2.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data1.fromJson(json["data"]);
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

class Data1 {
  String? uri;
  Profile1? profile;
  Visuals? visuals;

  Data1({this.uri, this.profile, this.visuals});

  Data1.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["profile"] is Map) {
      profile = json["profile"] == null ? null : Profile1.fromJson(json["profile"]);
    }
    if(json["visuals"] is Map) {
      visuals = json["visuals"] == null ? null : Visuals.fromJson(json["visuals"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    if(profile != null) {
      _data["profile"] = profile?.toJson();
    }
    if(visuals != null) {
      _data["visuals"] = visuals?.toJson();
    }
    return _data;
  }
}

class Visuals {
  AvatarImage? avatarImage;

  Visuals({this.avatarImage});

  Visuals.fromJson(Map<String, dynamic> json) {
    if(json["avatarImage"] is Map) {
      avatarImage = json["avatarImage"] == null ? null : AvatarImage.fromJson(json["avatarImage"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(avatarImage != null) {
      _data["avatarImage"] = avatarImage?.toJson();
    }
    return _data;
  }
}

class AvatarImage {
  List<Sources1>? sources;

  AvatarImage({this.sources});

  AvatarImage.fromJson(Map<String, dynamic> json) {
    if(json["sources"] is List) {
      sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources1.fromJson(e)).toList();
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

class Sources1 {
  String? url;
  int? width;
  int? height;

  Sources1({this.url, this.width, this.height});

  Sources1.fromJson(Map<String, dynamic> json) {
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

class Profile1 {
  String? name;

  Profile1({this.name});

  Profile1.fromJson(Map<String, dynamic> json) {
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

class Albums {
  int? totalCount;
  List<Items>? items;

  Albums({this.totalCount, this.items});

  Albums.fromJson(Map<String, dynamic> json) {
    if(json["totalCount"] is int) {
      totalCount = json["totalCount"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalCount"] = totalCount;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
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
  Artists? artists;
  CoverArt? coverArt;
  Date? date;

  Data({this.uri, this.name, this.artists, this.coverArt, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["artists"] is Map) {
      artists = json["artists"] == null ? null : Artists.fromJson(json["artists"]);
    }
    if(json["coverArt"] is Map) {
      coverArt = json["coverArt"] == null ? null : CoverArt.fromJson(json["coverArt"]);
    }
    if(json["date"] is Map) {
      date = json["date"] == null ? null : Date.fromJson(json["date"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["name"] = name;
    if(artists != null) {
      _data["artists"] = artists?.toJson();
    }
    if(coverArt != null) {
      _data["coverArt"] = coverArt?.toJson();
    }
    if(date != null) {
      _data["date"] = date?.toJson();
    }
    return _data;
  }
}

class Date {
  int? year;

  Date({this.year});

  Date.fromJson(Map<String, dynamic> json) {
    if(json["year"] is int) {
      year = json["year"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["year"] = year;
    return _data;
  }
}

class CoverArt {
  List<Sources>? sources;

  CoverArt({this.sources});

  CoverArt.fromJson(Map<String, dynamic> json) {
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

class Artists {
  List<Items1>? items;

  Artists({this.items});

  Artists.fromJson(Map<String, dynamic> json) {
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
  String? uri;
  Profile? profile;

  Items1({this.uri, this.profile});

  Items1.fromJson(Map<String, dynamic> json) {
    if(json["uri"] is String) {
      uri = json["uri"];
    }
    if(json["profile"] is Map) {
      profile = json["profile"] == null ? null : Profile.fromJson(json["profile"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    if(profile != null) {
      _data["profile"] = profile?.toJson();
    }
    return _data;
  }
}

class Profile {
  String? name;

  Profile({this.name});

  Profile.fromJson(Map<String, dynamic> json) {
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