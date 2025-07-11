import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<Uint8List?> getFrameAt(XFile video) async {
  return await VideoThumbnail.thumbnailData(
    video: video.path,
    imageFormat: ImageFormat.PNG,
    maxWidth: 1920,
    maxHeight: 1080,
    quality: 100,
  );
}