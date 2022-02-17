// import 'package:flutter/material.dart';

// class LiveStreamScreen extends StatefulWidget {
//   const LiveStreamScreen({ Key? key }) : super(key: key);

//   @override
//   _LiveStreamScreenState createState() => _LiveStreamScreenState();
// }

// class _LiveStreamScreenState extends State<LiveStreamScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({Key? key}) : super(key: key);

  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  bool _isPlaying = true;

  final VlcPlayerController _videoPlayerController =
      VlcPlayerController.network(
    'https://media.w3.org/2010/05/sintel/trailer.mp4',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: const Center(child: CircularProgressIndicator()),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () async {},
                child: const Icon(
                  Icons.fast_rewind,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _videoPlayerController.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _videoPlayerController.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () async {},
                child: const Icon(
                  Icons.fast_forward,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
