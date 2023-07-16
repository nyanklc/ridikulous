
import 'package:flutter/material.dart';

import 'post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int subPageIndex = 0;

  final pageViewController = PageController();

  static const List<Widget> subPageList = <Widget>[
    SubHome(),
    SubExplore(),
    SubCreate(),
    SubProfile(),
  ];

  void setPageIndex(int index) {
    setState(() {
      pageViewController.animateToPage(index,
          duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarImage = Image.asset('assets/skull.png');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: appBarImage,
        centerTitle: true,
        title: const Text("Ridikulous"),
        foregroundColor: Colors.white,
      ),
      body: PageView(
        controller: pageViewController,
        children: subPageList,
        onPageChanged: (index) {
          setState(() {
            subPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: subPageIndex,
          backgroundColor: Colors.black87,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.blue,
          unselectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              label: "Home",
              icon: Icon(Icons.home, color: Colors.white),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              label: "Explore",
              icon: Icon(Icons.search, color: Colors.white),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              label: "Create",
              icon: Icon(Icons.add_box, color: Colors.white),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              label: "Profile",
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
          onTap: setPageIndex,
        ),
      ),
    );
  }
}

class SubHome extends StatefulWidget {
  const SubHome({super.key});

  @override
  State<SubHome> createState() => _SubHomeState();
}

class _SubHomeState extends State<SubHome> {
  List<Post> mPostList = const <Post>[
    Post(
      ownerId: 1,
      ownerName: "noyan1",
    ),
    Post(
      ownerId: 2,
      ownerName: "noyan2",
    ),
    Post(
      ownerId: 3,
      ownerName: "noyan3",
    ),
    ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mPostList,
    );
  }
}

class SubExplore extends StatelessWidget {
  const SubExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("EXPLORE");
  }
}

class SubCreate extends StatelessWidget {
  const SubCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("CREATE");
  }
}

class SubProfile extends StatelessWidget {
  const SubProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("PROFILE");
  }
}
