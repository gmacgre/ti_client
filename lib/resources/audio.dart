import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  final AudioPlayer _clickPlayer = AudioPlayer();
  static final AudioManager _manager = AudioManager();
  void playClick() {
    _clickPlayer.play(UrlSource('https://cdn.freesound.org/previews/421/421364_3387258-lq.mp3'));
  }
  static AudioManager get manager => _manager;
}