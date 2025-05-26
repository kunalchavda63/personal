import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_controller.g.dart';

@Riverpod(keepAlive: true)
class AudioController extends _$AudioController {
  late final AudioPlayer _player;

  @override
  AudioPlayer build() {
    _player = AudioPlayer();

    // Add error listener
    _player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace st) {
        print('Audio player error: $e');
      },
    );

    // Dispose when provider is disposed
    ref.onDispose(() {
      _player.dispose();
    });

    return _player;
  }

  Future<void> playAudio({required String assetPath}) async {
    try {
      // Stop any currently playing audio first
      await _player.stop();

      // Load the new asset
      await _player.setAsset(assetPath);

      // Play the audio
      await _player.play();
    } catch (e, st) {
      print('Error playing audio: $e\n$st');
      rethrow;
    }
  }

  Future<void> pauseAudio() async {
    if (_player.playing) {
      await _player.pause();
    }
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }

  Future<void> resumeAudio() async {
    if (!_player.playing) {
      await _player.play();
    }
  }
}
