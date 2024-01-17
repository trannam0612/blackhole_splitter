class YoutubeChannel {
  String? channelId = '';
  String? channelUrl = '';
  String? channelName = '';
  String? channelDescription = '';
  String? keywords = '';
  String? profilePictureUrl = '';
  String? bannerPictureUrl = '';
  String? joinedDate = '';
  String? subsCount = '';
  int? videosCount = 0;
  int? totalViewsCount = 0;
  bool? isVerified = false;
  YoutubeVideo? videoData;

  YoutubeChannel({
    this.channelId,
    this.channelUrl,
    this.channelName,
    this.channelDescription,
    this.keywords,
    this.profilePictureUrl,
    this.bannerPictureUrl,
    this.joinedDate,
    this.subsCount,
    this.videosCount,
    this.totalViewsCount,
    this.isVerified,
    this.videoData,
  });

  factory YoutubeChannel.fromMap(Map<String?, String?> map) {
    return YoutubeChannel(
      channelId: map['channelId'].toString() == null ? '' : map['channelId'],
      channelUrl: map['channelUrl'].toString() == null ? '' : map['channelUrl'],
      channelName:
          map['channelName'].toString() == null ? '' : map['channelName'],
      channelDescription: map['channelDescription'].toString() == null
          ? ''
          : map['channelDescription'],
      keywords: map['keywords'].toString() == null ? '' : map['keywords'],
      profilePictureUrl: map['profilePictureUrl'].toString() == null
          ? ''
          : map['profilePictureUrl'],
      bannerPictureUrl: map['bannerPictureUrl'].toString() == null
          ? ''
          : map['bannerPictureUrl'],
      joinedDate: map['joinedDate'].toString() == null ? '' : map['joinedDate'],
      // subsCount: map['subsCount'].toString()==null?'':map['subsCount'],
      videosCount: int.parse(map['videosCount'].toString() == null
          ? ''
          : map['videosCount'] ?? ''),
      // totalViewsCount: int?.parse(map['totalViewsCount'].toString()==null?'':map['totalViewsCount'].toString()),
      isVerified: map['isVerified'].toString() == 'false' ? false : true,
    );
  }
}

class YoutubeVideo {
  String? videolink = '';
  String? title = '';
  String? description = '';
  String? thumbnail = '';
  String? ownerUrl = '';
  String? channelName = '';
  String? category = '';
  String? date = '';
  bool? isPrivate = true;
  int? length = 0;
  int? viewsCount = 0;
  int? likesCount = 0;
  int? dislikesCount = 0;
  // int? commentsCount = 0;
  List<VideoInfo>? videoInfo;
  List<AudioInfo>? audioInfo;

  YoutubeVideo({
    this.videolink,
    this.title,
    this.description,
    this.thumbnail,
    this.ownerUrl,
    this.channelName,
    this.category,
    this.date,
    this.length,
    this.isPrivate,
    this.viewsCount,
    this.likesCount,
    this.dislikesCount,
    // this.commentsCount,
    this.videoInfo,
    this.audioInfo,
  });

  factory YoutubeVideo.fromMap(Map<String?, String?> map) {
    return YoutubeVideo(
      videolink: map['videolink'].toString(),
      title: map['title'].toString(),
      description: map['description'].toString(),
      thumbnail: map['thumbnail'].toString(),
      ownerUrl: map['ownerUrl'].toString(),
      channelName: map['channelName'].toString(),
      category: map['category'].toString(),
      date: map['date'].toString(),
      isPrivate: map['isPrivate'] == 'false' ? false : true,
      length: int?.parse(map['length'].toString()),
      viewsCount: int?.parse(map['viewsCount'].toString()),
      likesCount: int?.parse(map['likesCount'].toString()),
      dislikesCount: int?.parse(map['likesCount'].toString()),
      // commentsCount: int?.parse(map['commentsCount'].toString()),
      videoInfo: [],
      audioInfo: [],
    );
  }
}

class VideoInfo {
  int? videoItag = 0;
  String? videoUrl = '';
  String? videoMimeType = '';
  String? videoWidth = '';
  String? videoHeight = '';
  String? videoQuality = '';
  bool? hasAudio = false;

  VideoInfo({
    this.videoItag,
    this.videoUrl,
    this.videoMimeType,
    this.videoWidth,
    this.videoHeight,
    this.videoQuality,
    this.hasAudio,
  });

  factory VideoInfo.fromMap(Map<String?, String?> map) {
    return VideoInfo(
      videoItag: int?.parse(map['videoItag'].toString()),
      videoUrl: map['videoUrl'].toString(),
      videoWidth: map['videoWidth'].toString(),
      videoHeight: map['videoHeight'].toString(),
      videoQuality: map['videoQuality'].toString(),
      videoMimeType: map['videoMimeType'].toString(),
    );
  }
}

class AudioInfo {
  int? audioItag = 0;
  String? audioUrl = '';
  String? audioMimeType = '';
  int? audioBitrate = 0;

  AudioInfo({
    this.audioItag,
    this.audioUrl,
    this.audioMimeType,
    this.audioBitrate,
  });

  factory AudioInfo.fromMap(Map<String?, String?> map) {
    return AudioInfo(
      audioItag: int?.parse(map['audioItag'].toString()),
      audioUrl: map['audioUrl'].toString(),
      audioMimeType: map['audioMimeType'].toString(),
      audioBitrate: int?.parse(['audioBitrate'].toString()),
    );
  }
}
