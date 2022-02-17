import 'package:camigence_app/screens/home/components/wavy_bottom_bar.dart';
import 'package:camigence_app/screens/home/widgets/help_screen.dart';
import 'package:camigence_app/screens/home/widgets/live_stream_screen.dart';
import 'package:camigence_app/screens/home/widgets/notification_screen.dart';
import 'package:flutter/material.dart';

import 'components/bottom_icon.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavigationBarItemIndex = 1;
  final List<Widget> _children = [
    const LiveStreamScreen(),
    const NotificationScreen(),
    const HelpScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Camigence"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              _children[bottomNavigationBarItemIndex],
              const WavyBottomBar(),
              Positioned(
                bottom: 0,
                left: size.width * 0.02,
                right: size.width * 0.02,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomIcon(
                      onPressed: () {
                        setState(() {
                          bottomNavigationBarItemIndex = 0;
                        });
                      },
                      bottomIcons: bottomNavigationBarItemIndex == 0
                        ? true : false,
                      text: "Live Stream",
                      icons: Icons.tv
                    ),
                    BottomIcon(
                      onPressed: () {
                        setState(() {
                          bottomNavigationBarItemIndex = 1;
                        });
                      },
                      bottomIcons: bottomNavigationBarItemIndex == 1 ? true : false,
                      text: "Notifications",
                      icons: Icons.notifications
                    ),
                    BottomIcon(
                      onPressed: () {
                        setState(() {
                          bottomNavigationBarItemIndex = 2;
                        });
                      },
                      bottomIcons: bottomNavigationBarItemIndex == 2 ? true : false,
                      text: "Help",
                      icons: Icons.question_answer_rounded
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}


// import 'package:camigence_app/screens/home/widgets/help_screen.dart';
// import 'package:camigence_app/screens/home/widgets/live_stream_screen.dart';
// import 'package:camigence_app/screens/home/widgets/notification_screen.dart';
// import 'package:flutter/material.dart';

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     const LiveStreamScreen(),
//     const NotificationScreen(),
//     const HelpScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Camigence"),
//       ),
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.tv),
//             label: "Live Stream",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notification_add_outlined),
//             label: "Notifications",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.help_outline),
//             label: "Help",
//           ),
//         ],
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
