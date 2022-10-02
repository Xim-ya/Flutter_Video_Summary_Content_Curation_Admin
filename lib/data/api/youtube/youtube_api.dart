import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:video_curation_admin/data/api/youtube/response/youtube_channel_response.dart';
part 'youtube_api.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class YoutubeApi {
  factory YoutubeApi(Dio dio, {String baseUrl}) = _YoutubeApi;

  // YotubeAPI V3 > 채널 정보 호출
  @GET(
      '/channels?part=statistics&part=snippet&id={channelId}&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY')
  Future<YoutubeChannelResponse> loadYoutubeChannel(
      @Path('channelId') String channelId);
}
