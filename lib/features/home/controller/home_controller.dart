import 'dart:convert';
import 'dart:io';

import 'package:blackhole_spliter/data/youtube_data.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


Directory dir = Directory('/storage/emulated/0/SaveIt/Youtube');
Directory thumbDir = Directory('/storage/emulated/0/.saveit/.thumbs');

class HomeController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print('onInit HomeController');
    getPath();
  }

  late Directory? pathDown;

  void getPath() async {
    final Directory tempDir = await getTemporaryDirectory();
    print('tempDir:${tempDir}');

    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    print('appDocumentsDir:${appDocumentsDir}');

    final Directory? downloadsDir = await getDownloadsDirectory();
    print('downloadsDir:${downloadsDir}');
    pathDown = appDocumentsDir;
  }

  void download(downloadUrl, name) async {
    // var path = await findLocalPath(platform) + '/';
    print('start download');
    await FlutterDownloader.enqueue(
      url: downloadUrl,
      savedDir: pathDown?.path ?? '',
      fileName: name,
      showNotification: true,
      openFileFromNotification: true,
    );
    print('finish download');
  }

  void getListFile() async {
    final List<FileSystemEntity>? list = await pathDown?.listSync();
    print('list:${list}');
  }

  FutureBuilder<VideoInfo>(
        future: FlutterYoutubeDownloader.downloadYoutubeVideo(
            "https://www.youtube.com/watch?v=CLn45NV6onE", "mp3"),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ElevatedButton(
                  onPressed: () {
                    print(snapshot.data?.authorName);
                    print(snapshot.data?.authorUrl);
                    print(snapshot.data?.downloadUrl);
                    print(snapshot.data?.height);
                    print(snapshot.data?.html);
                    print(snapshot.data?.providerUrl);
                    print(snapshot.data?.thumbnailHeight);
                    print(snapshot.data?.thumbnailWidth);
                    print(snapshot.data?.thumbnailUrl);
                    print(snapshot.data?.title);
                    print(snapshot.data?.type);
                    print(snapshot.data?.width);
                  },
                  child: const Text("Download Video"))
              : const CircularProgressIndicator();
        },
      ),

  // static Future<YoutubeChannel> channelInfoFromUrl(String url) async {
  //   String _temporaryData = '', _patternStart = '', _patternEnd = '';
  //   int _startInx = 0, _endInx = 1;
  //   http.Client _client = http.Client();
  //   http.Response _response;
  //   Map<String, String> _postData = Map<String, String>();
  //   var _document, jsonData;

  //   try {
  //     _response = await _client.get(Uri(host: '$url'));
  //     _document = parse(_response.body);
  //     _document = _document.querySelectorAll('body');
  //     _temporaryData = _document[0].text;
  //     _temporaryData = _temporaryData.trim();
  //     _temporaryData = _temporaryData.replaceAll('\n', '');

  //     _patternStart = 'window["ytInitialData"] = ';
  //     _patternEnd = ';    window["ytInitialPlayerResponse"]';
  //     _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
  //     _endInx = _temporaryData.indexOf(_patternEnd);
  //     _temporaryData = _temporaryData.substring(_startInx, _endInx);
  //     jsonData = json.decode(_temporaryData.toString());

  //     _postData['channelId'] =
  //         jsonData['header']['c4TabbedHeaderRenderer']['channelId'].toString();
  //     _postData['channelUrl'] = jsonData['metadata']['channelMetadataRenderer']
  //             ['channelUrl']
  //         .toString();
  //     _postData['channelName'] =
  //         jsonData['header']['c4TabbedHeaderRenderer']['title'].toString();
  //     _postData['channelDescription'] = jsonData['metadata']
  //             ['channelMetadataRenderer']['description']
  //         .toString()
  //         .replaceAll('\n', ' ');
  //     _postData['keywords'] = '';
  //     for (var item in jsonData['microformat']['microformatDataRenderer']
  //         ['tags']) {
  //       _postData['keywords'] = (_postData['keywords'] ?? '') + item.toString();
  //     }
  //     _postData['keywords'] = _postData['keywords']!
  //         .substring(0, (_postData['keywords']?.length ?? 0) - 1);
  //     _postData['profilePictureUrl'] = jsonData['metadata']
  //             ['channelMetadataRenderer']['avatar']['thumbnails'][0]['url']
  //         .toString();
  //     _postData['bannerPictureUrl'] = jsonData['header']
  //             ['c4TabbedHeaderRenderer']['banner']['thumbnails'][5]['url']
  //         .toString();
  //     _postData['subsCount'] = jsonData['header']['c4TabbedHeaderRenderer']
  //             ['subscriberCountText']['runs'][0]['text']
  //         .toString()
  //         .replaceAll(' subscribers', '');
  //     _postData['videosCount'] = jsonData['contents']
  //                             ['twoColumnBrowseResultsRenderer']
  //                         ['secondaryContents']
  //                     ['browseSecondaryContentsRenderer']['contents'][0]
  //                 ['verticalChannelSectionRenderer']['items'][0]
  //             ['miniChannelRenderer']['videoCountText']['runs'][0]['text']
  //         .toString()
  //         .replaceAll(' videos', '');
  //     _postData['isVerified'] = jsonData['contents']
  //                                 ['twoColumnBrowseResultsRenderer']
  //                             ['secondaryContents']
  //                         ['browseSecondaryContentsRenderer']['contents'][0]
  //                     ['verticalChannelSectionRenderer']['items'][0]
  //                 ['miniChannelRenderer']['ownerBadges'][0]
  //             ['metadataBadgeRenderer']['tooltip']
  //         .toString();
  //     _postData['isVerified'] =
  //         _postData['isVerified'] == 'Verified' ? 'true' : 'false';

  //     _youtubeChannel = YoutubeChannel.fromMap(_postData);
  //   } catch (error) {
  //     print('[YoutubeData][channelInfoFromUrl]: $error');
  //   }
  //   return _youtubeChannel;
  // }

  // static Future<YoutubeChannel> videoFromUrl(String url) async {
  //   String _temporaryData = '', _patternStart = '', _patternEnd = '';
  //   int _startInx = 0, _endInx = 1;
  //   http.Client _client = http.Client();
  //   http.Response _response;
  //   Map<String, String> _postData = Map<String, String>();
  //   List<VideoInfo> video = [];
  //   List<AudioInfo> audio = [];
  //   var _document, jsonData;

  //   try {
  //     _response = await _client.get(Uri(host: '$url'));
  //     _document = parse(_response.body);
  //     _document = _document.querySelectorAll('body');
  //     _temporaryData = _document[0].text;
  //     _temporaryData = _temporaryData.trim();

  //     _patternStart = '"streamingData":';
  //     _patternEnd = ',"playbackTracking"';
  //     _temporaryData = _temporaryData.replaceAll('\\\\u0026', '&');
  //     _temporaryData = _temporaryData.replaceAll('\\\/', '/');
  //     _temporaryData = _temporaryData.replaceAll('\\\"', '"');
  //     _temporaryData = _temporaryData.replaceAll('\\\\', '');
  //     _temporaryData = _temporaryData.replaceAll('codecs="', 'codecs=');
  //     _temporaryData = _temporaryData.replaceAll('""', '"');
  //     _startInx = _temporaryData.indexOf(_patternStart);
  //     _endInx = _temporaryData.indexOf(_patternEnd);
  //     _temporaryData = '{' + _temporaryData.substring(_startInx, _endInx) + '}';
  //     jsonData = json.decode(_temporaryData.toString());
  //     jsonData = jsonData['streamingData'];

  //     //DATA FOUND
  //     for (var item in jsonData['formats']) {
  //       video.add(VideoInfo(
  //         videoItag: item['itag'],
  //         videoUrl: item['url'].toString(),
  //         videoMimeType: item['mimeType'].toString(),
  //         videoWidth: item['width'].toString(),
  //         videoHeight: item['height'].toString(),
  //         videoQuality: item['qualityLabel'].toString(),
  //         hasAudio: true,
  //       ));
  //     }
  //     List qual = [];
  //     for (int x = 0; x < jsonData['adaptiveFormats'].length - 4; x++) {
  //       if (qual.contains(
  //           jsonData['adaptiveFormats'][x]['qualityLabel'].toString())) {
  //       } else {
  //         qual.add(jsonData['adaptiveFormats'][x]['qualityLabel'].toString());
  //         video.add(VideoInfo(
  //           videoItag: jsonData['adaptiveFormats'][x]['itag'],
  //           videoUrl: jsonData['adaptiveFormats'][x]['url'].toString(),
  //           videoMimeType:
  //               jsonData['adaptiveFormats'][x]['mimeType'].toString(),
  //           videoWidth: jsonData['adaptiveFormats'][x]['width'].toString(),
  //           videoHeight: jsonData['adaptiveFormats'][x]['height'].toString(),
  //           videoQuality:
  //               jsonData['adaptiveFormats'][x]['qualityLabel'].toString(),
  //           hasAudio: false,
  //         ));
  //       }
  //     }
  //     for (int x = jsonData['adaptiveFormats'].length - 4;
  //         x < jsonData['adaptiveFormats'].length;
  //         x++) {
  //       int tag = jsonData['adaptiveFormats'][x]['itag'];
  //       int? bit;
  //       if (tag == 140) {
  //         bit = 128;
  //       } else if (tag == 249) {
  //         bit = 48;
  //       } else if (tag == 250) {
  //         bit = 64;
  //       } else if (tag == 251) {
  //         bit = 160;
  //       }
  //       audio.add(AudioInfo(
  //         audioItag: jsonData['adaptiveFormats'][x]['itag'],
  //         audioUrl: jsonData['adaptiveFormats'][x]['url'].toString(),
  //         audioMimeType: jsonData['adaptiveFormats'][x]['mimeType'].toString(),
  //         audioBitrate: bit,
  //       ));
  //     }

  //     _patternStart = '"playerMicroformatRenderer":';
  //     _patternEnd = ',"uploadDate":';
  //     _temporaryData = _document[0].text;
  //     _temporaryData = _temporaryData.trim();
  //     _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
  //     _endInx = _temporaryData.indexOf(_patternEnd) + _patternEnd.length + 13;
  //     _temporaryData = _temporaryData.substring(_startInx, _endInx);
  //     jsonData = json.decode(_temporaryData.toString());

  //     _postData['videolink'] = url;
  //     _postData['title'] = jsonData['title']['simpleText'].toString();
  //     _postData['description'] =
  //         jsonData['description']['simpleText'].toString().replaceAll('"', '');
  //     _postData['description'] =
  //         (_postData['description'] ?? '').replaceAll('\n', '  ');
  //     _postData['thumbnail'] = jsonData['thumbnail']['thumbnails'][0]['url'];
  //     _postData['ownerUrl'] = jsonData['ownerProfileUrl'].toString();
  //     _postData['channelName'] = jsonData['ownerChannelName'].toString();
  //     _postData['category'] = jsonData['category'].toString();
  //     _postData['date'] = jsonData['uploadDate'].toString();
  //     _postData['length'] = jsonData['lengthSeconds'].toString();
  //     _postData['viewsCount'] = jsonData['viewCount'].toString();

  //     _patternStart = ',"topLevelButtons":';
  //     _patternEnd = ',{"buttonRenderer"';
  //     _temporaryData = _document[0].text;
  //     _temporaryData = _temporaryData.trim();
  //     _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
  //     _endInx = _temporaryData.indexOf(_patternEnd);
  //     _temporaryData = _temporaryData.substring(_startInx, _endInx) + ']';
  //     jsonData = json.decode(_temporaryData.toString());

  //     _postData['likesCount'] = jsonData[0]['toggleButtonRenderer']
  //             ['defaultText']['accessibility']['accessibilityData']['label']
  //         .toString()
  //         .replaceAll(' likes', '');
  //     _postData['likesCount'] =
  //         (_postData['likesCount'] ?? '').replaceAll(',', '');
  //     _postData['dislikesCount'] = jsonData[1]['toggleButtonRenderer']
  //             ['defaultText']['accessibility']['accessibilityData']['label']
  //         .toString()
  //         .replaceAll(' dislikes', '');
  //     _postData['dislikesCount'] =
  //         (_postData['dislikesCount'] ?? '').replaceAll(',', '');

  //     _patternStart = ',"isPrivate":';
  //     _patternEnd = ',"isUnpluggedCorpus"';
  //     _temporaryData = _document[0].text;
  //     _temporaryData = _temporaryData.trim();
  //     _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
  //     _endInx = _temporaryData.indexOf(_patternEnd);
  //     _temporaryData = _temporaryData.substring(_startInx, _endInx);
  //     _postData['isPrivate'] = _temporaryData.toString();

  //     _youtubeChannel = await channelInfoFromUrl(_postData['ownerUrl'] ?? '');
  //     _youtubeChannel.videoData = YoutubeVideo.fromMap(_postData);
  //     _youtubeChannel.videoData.videoInfo = video;
  //     _youtubeChannel.videoData.audioInfo = audio;
  //   } catch (error) {
  //     print('[YoutubeData][videoFromUrl]: $error');
  //   }

  //   return _youtubeChannel;
  // }
}
