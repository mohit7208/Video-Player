import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:videolist/model.dart/profile.dart';
import 'package:videolist/profile_page.dart';
import 'package:toast/toast.dart';

class VideoPageView extends StatefulWidget {
  @override
  _VideoStatePageView createState() => _VideoStatePageView();
}

class _VideoStatePageView extends State<VideoPageView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController pageController = PageController();
  List<VideoController> vcs = [];
  var videoList = [
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'http://techslides.com/demos/sample-videos/small.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
  ];

  var profileList = [
    Profile(
      name: 'Rohit Sharma',
      email: 'rohit@mail.com',
      gender: 'M',
      age: 18,
    ),
    Profile(
      name: 'Bhoomi Pednekar',
      email: 'bhoomi@mail.com',
      gender: 'F',
      age: 20,
    ),
    Profile(
      name: 'Kunal Shah',
      email: 'kunal@mail.com',
      gender: 'M',
      age: 26,
    ),
    Profile(
      name: 'Priyank Goyaal',
      email: 'priyank@mail.com',
      gender: 'M',
      age: 22,
    ),
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < videoList.length; i++) {
      vcs.add(
          VideoController(source: VideoPlayerController.network(videoList[i]))
            ..initialize());
    }
  }

  @override
  void dispose() {
    for (var vc in vcs) {
      vc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SwipeDetector(
        onSwipeLeft: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProfilePage(
                name: profileList[0].name,
                email: profileList[0].email,
                gender: profileList[0].gender,
                age: profileList[0].age,
              ),
            ),
          );
        },
        onSwipeRight: () {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text('Subscribed !'),
            ),
          );
        },
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoBox(
                controller: vcs[index],
              ),
            );
          },
          itemCount: videoList.length,
        ),
      ),
    );
  }
}

// onSwipeLeft: () {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => ProfilePage(
//         name: profileList[index].name,
//         email: profileList[index].email,
//         gender: profileList[index].gender,
//         age: profileList[index].age,
//       ),
//     ),
//   );
// },
