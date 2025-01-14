import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:readify/Screens/BookDetails.dart';
import 'package:readify/core/Constants.dart';

class PDFF extends StatefulWidget {
  const PDFF({super.key});

  @override
  State<PDFF> createState() => _PDFFState();

  // Define a static list for voices and images (names are the same)
  static final List<String> names = [ 'د.يحي الفخراني', 'د.أحمد خالد توفيق','د.عبدالوهاب المسيري', 'عمر الشريف'];
}
String _activeVoice = PDFF.names[0];
class _PDFFState extends State<PDFF> {


  Constants consts = Constants();
  int pdfNum = 1;
  late PdfControllerPinch pdfControllerPinch;
  final player = AudioPlayer();

  bool _isPlaying = false;
  bool _isLocked = false;
  bool _playerUp = true;
  bool _durationUp = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String formatTime(int seconds) {
    return '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void dispose() {
    print("Back To old Screen");
    super.dispose();
    player.dispose();
  }

  BookDetails book = BookDetails();

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: PdfDocument.openAsset(consts.pdfPath[pdfNum]));

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newduration) {
      setState(() {
        _duration = newduration;
      });
    });

    player.onPositionChanged.listen((newposition) {
      setState(() {
        _position = newposition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            child: PdfViewPinch(controller: pdfControllerPinch),
            onTap: () {
              setState(() {
                if (!_isLocked) _playerUp = !_playerUp;
              });
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20, 8, 0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _isLocked = !_isLocked;
                    });
                  },
                  icon: Icon(
                    _isLocked ? Icons.lock_outline : Icons.lock_open,
                    size: 45,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _playerUp,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff2E4374),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.chat),
                          color: Colors.white,
                          iconSize: 50.0,
                          onPressed: () {
                            Navigator.pushNamed(context, 'chat');
                          },
                        ),
                        VoiceSelectorButton(
                          voices: PDFF.names,
                          onSelected: (String voice) {
                            setState(() {
                              _activeVoice = voice;
                              player.play(AssetSource('$_activeVoice.mp3'));
                              print(_activeVoice);
                            });
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (!_isLocked) {
                                    _position -= Duration(seconds: 5);
                                    player.seek(_position);
                                  }
                                });
                              },
                              icon: Icon(Icons.replay_10_outlined, color: Colors.white, size: 40),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _position = Duration.zero;
                                  player.seek(_position);
                                });
                              },
                              icon: Icon(Icons.skip_previous, color: Colors.white, size: 40),
                            ),
                          ),
                          Stack(
                            children: [
                              Positioned(
                                child: CircleAvatar(radius: 16, backgroundColor: Colors.white),
                                top: 15,
                                left: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 0),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!_isLocked) {
                                        if (_isPlaying)
                                          player.pause();
                                        else
                                          player.play(AssetSource('$_activeVoice.mp3'));
                                        _durationUp = true;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    _isPlaying ? Icons.pause_circle : Icons.play_circle,
                                    color: Color(0xff5EC9EF),
                                    size: 55,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _position = _duration;
                                  player.seek(_position);
                                });
                              },
                              icon: Icon(Icons.skip_next, color: Colors.white, size: 40),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (!_isLocked) {
                                    _position += Duration(seconds: 5);
                                    player.seek(_position);
                                  }
                                });
                              },
                              icon: Icon(Icons.forward_10_outlined, color: Colors.white, size: 40),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      inactiveColor: Colors.white,
                      activeColor: Colors.blue[200],
                      min: 0,
                      max: Duration(hours: 1, seconds: 73).inSeconds.toDouble(), // Fixed (fake) duration
                      value: _position.inSeconds.toDouble(),
                      onChanged: (value) {
                        if (!_isLocked) {
                          final position = Duration(seconds: value.toInt());
                          player.seek(position);
                        }
                      },
                    ),
                    Visibility(
                      visible: _durationUp,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatTime(_position.inSeconds), style: TextStyle(height: 1, color: Colors.white)),
                            Text(formatTime(Duration(hours: 1, seconds: 73).inSeconds), style: TextStyle(height: 1, color: Colors.white)), // Fixed (fake) duration
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VoiceSelectorButton extends StatelessWidget {
  final List<String> voices;
  final ValueChanged<String> onSelected;

  VoiceSelectorButton({required this.voices, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IconButton(
        icon: Icon(Icons.record_voice_over),
        color: Colors.white,
        iconSize: 50.0,
        onPressed: () async {
          final RenderBox button = context.findRenderObject() as RenderBox;
          final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
          final RelativeRect position = RelativeRect.fromRect(
            Rect.fromPoints(
              button.localToGlobal(Offset.zero, ancestor: overlay),
              button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
            ),
            Offset.zero & overlay.size,
          );

          final String? selectedVoice = await showMenu<String>(
            context: context,
            position: position,
            items: voices.map((String voice) {
              return PopupMenuItem<String>(
                value: voice,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/$voice.png'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      voice,
                      style: TextStyle(
                        color: voice == _activeVoice ? Colors.blueAccent : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );

          if (selectedVoice != null) {
            onSelected(selectedVoice);
          }
        },
      ),
    );
  }
}
