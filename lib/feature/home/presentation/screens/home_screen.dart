import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.grey[900]!],
          ),
        ),
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTabBar(),
                    const SizedBox(height: 20),
                    buildComingSoonSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.apps, color: Color(0xFFab8e63), size: 30),
      title: const Row(
        children: [
          Text(
            'King',
            style: TextStyle(
              color: Color(0xFFab8e63),
              fontWeight: FontWeight.bold,
              fontSize: 24,
              shadows: [
                Shadow(blurRadius: 5, color: Colors.black, offset: Offset(2, 2))
              ],
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.emoji_events, color: Color(0xFFab8e63), size: 24),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Color(0xFFab8e63), size: 30),
          onPressed: () {
            // Notification action
          },
        ),
      ],
    );
  }

  Widget buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey[850],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildTabButton(0, "Home"),
            buildTabButton(1, "Course"),
            buildTabButton(2, "Live Courses"),
            buildTabButton(3, "Recorded Classes"),
            buildTabButton(4, "E-book Access"),
            buildTabButton(5, "IPO's"),
            buildTabButton(6, "Success Stories"),
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(int index, String label) {
    bool isSelected = index == selectedButtonIndex;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedButtonIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFFab8e63) : Colors.grey[850],
          elevation: isSelected ? 10 : 3,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildComingSoonSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Coming Soon!',
              style: TextStyle(
                color: Color(0xFFab8e63),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(blurRadius: 4, color: Colors.black, offset: Offset(2, 2))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Our trading platform is under development. Stay tuned for exciting features and updates.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 18,
              fontWeight: FontWeight.w400,
              shadows: const [
                Shadow(blurRadius: 3, color: Colors.black, offset: Offset(1, 1))
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildCarouselSlider(),
          const SizedBox(height: 20),
          buildTopBrokersSection(),
          const SizedBox(height: 20),
          buildCourseSection(),
        ],
      ),
    );
  }

  Widget buildCarouselSlider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeInOut,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            viewportFraction: 0.9,
          ),
          items: [
            buildCarouselItem('assets/image1.jpg'),
            buildCarouselItem('assets/image2.jpg'),
            buildCarouselItem('assets/image3.jpg'),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/placeholder.png',
          image: imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTopBrokersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Top Brokers",
            style: TextStyle(
              color: Color(0xFFab8e63),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(blurRadius: 4, color: Colors.black, offset: Offset(2, 2))],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildCircleAvatar('Bank 1'),
              buildCircleAvatar('Bank 2'),
              buildCircleAvatar('Bank 3'),
              buildCircleAvatar('Bank 4'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCircleAvatar(String bankName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.rotationY(0.1),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: const Color(0xFFab8e63),
          foregroundColor: Colors.black.withOpacity(0.5),
          child: Text(
            bankName,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildCourseSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Complete Learning Course",
            style: TextStyle(
              color: Color(0xFFab8e63),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(blurRadius: 4, color: Colors.black, offset: Offset(2, 2))],
            ),
          ),
        ),
        const SizedBox(height: 10),
        buildCourseListView("Startup Trader"),
        buildCourseListView("Advanced Trader"),
        buildCourseListView("Professional Trader"),
        buildCourseListView("Expert Trader"),
      ],
    );
  }

  Widget buildCourseListView(String courseName) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      tileColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        courseName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(blurRadius: 2, color: Colors.black, offset: Offset(1, 1))],
        ),
      ),
      trailing: const Icon(Icons.arrow_forward, color: Color(0xFFab8e63)),
    );
  }
}
