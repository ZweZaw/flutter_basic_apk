import 'package:flutter/material.dart';
class HeroExample extends StatelessWidget {
  const HeroExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: GestureDetector(
                onTap: () => showSecondPage(context),
                child: const Hero(
                  tag: 'my-hero-animation-tag',
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/img2.jpg"),
                  ),
                ),
              ),
              title: const Text("Tap on the photo to view the animation transition"),
            ),
            const Divider(),
            ListTile(
              leading: GestureDetector(
                onTap: () => showThirdPage(context),
                child: const Hero(
                  tag: 'my-hero-animation-tag',
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/img1.png"),
                  ),
                ),
              ),
              title: const Text("Tap on the photo to view the animation transition"),
            ),
          ],
        ),
      ),
    );
  }
  void showSecondPage(BuildContext context){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Scaffold(
            body: Center(
              child: Hero(
                tag: 'my-hero-animation-tag',
                child: Image.asset("assets/images/img2.jpg"),
              ),
            ),
          ),
        )
    );
  }
  void showThirdPage(BuildContext context){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Scaffold(
            body: Center(
              child: Hero(
                tag: 'my-hero-animation-tag',
                child: Image.asset("assets/images/img1.png"),
              ),
            ),
          ),
        )
    );
  }
}
