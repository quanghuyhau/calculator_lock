import 'package:calculator_lock/generated/assets.dart';
import 'package:calculator_lock/presentation/common/load_image/load_image.dart';
import 'package:flutter/material.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  List<Widget> pages = [
    const OnboardingPage(title: "Welcome", description: "Welcome to our app!"),
    const OnboardingPage(title: "Feature 1", description: "Track your spending."),
    const OnboardingPage(title: "Feature 2", description: "Set budget goals."),
    const OnboardingPage(title: "Get Started", description: "Let's begin!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemCount: pages.length,
              itemBuilder: (_, index) => pages[index],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
                  (index) => Container(
                margin: const EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == pages.length - 1) {
                  // navigate to main screen
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text(currentIndex == pages.length - 1 ? "Get Started" : "Next"),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingPage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesBackgroundApp),
          fit: BoxFit.cover,
        ),
      ),
      child:      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),

    );

  }
}
