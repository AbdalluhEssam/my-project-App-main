import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import 'package:my_project/core/Constant/Exit_App/ExitApp.dart';
import '../../../Choose_departmant/Screen/View/ChooseDepartmentView.dart';
import '../../Controller/OnBoardingController.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnboardingController controller = Get.put(OnboardingController());
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<bool> onWillPop() async {
    final dialog = ExitApp(context);
    return await dialog.show();
  }

  // List of onboarding data
  final List<Map<String, dynamic>> onboardingData = [
    {
      'imagePath': 'onboarding_one.png',
      'title': Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحباً بك في تطبيق",
                style: bigstBlackColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Project",
                style: bigstOrangeColor,
              ),
            ],
          ),
        ],
      ),
      'subTitle': 'منصة لأدارة مشروعات التخرج',
      'subTitleStyle': smallBlackColor,
    },
    {
      'imagePath': 'onboarding_two.png',
      'title': Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "المشاريع",
                style: bigstOrangeColor,
              ),
              Text(
                " متابعة تقدم",
                style: bigstBlackColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "بشكل مرن",
                style: bigstBlackColor,
              ),
              Text(
                " وتنظيمها",
                style: bigstOrangeColor,
              ),
            ],
          ),
        ],
      ),
      'subTitle': 'راقب تطور المشاريع وتأكد من تحقيق الأهداف بكفاءة ووضوح',
      'subTitleStyle': smallBlackColor,
    },
    {
      'imagePath': 'onboarding_three.png',
      'title': Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "للمهام",
                style: bigstOrangeColor,
              ),
              Text(
                " إدارة ذكية",
                style: bigstBlackColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "أفضل النتائج",
                style: bigstBlackColor,
              ),
              Text(
                " لتحقيق",
                style: bigstOrangeColor,
              ),
            ],
          ),
        ],
      ),
      'subTitle': 'حدد المهام ووزعها بفعالية لضمان تحقيق سير عمل منظم ومنتج',
      'subTitleStyle': smallBlackColor,
    },
    {
      'imagePath': 'onboarding_four.png',
      'title': Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "فعال",
                style: bigstOrangeColor,
              ),
              Text(
                " وجود تواصل",
                style: bigstBlackColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "لتحسين التعاون",
                style: bigstBlackColor,
              ),
              Text(
                " وسريع",
                style: bigstOrangeColor,
              ),
            ],
          ),
        ],
      ),
      'subTitle': 'ابقَ على اتصال دائم مع فريقك لتعزيز التنسيق والعمل الجماعي',
      'subTitleStyle': smallBlackColor,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            // PageView for onboarding screens
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  imagePath: onboardingData[index]['imagePath'],
                  title: onboardingData[index]['title'],
                  subTitle: onboardingData[index]['subTitle'],
                  subTitleStyle: onboardingData[index]['subTitleStyle'],
                );
              },
            ),
            // Skip Button
            Positioned(
              top: 40,
              right: 20,
              child: TextButton(
                onPressed: () {
                  controller.onSkip();
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Page Indicator and Navigation Buttons
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Page Indicator Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? orangeColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Navigation Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous Button
                      _currentPage > 0
                          ? Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orangeColor,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : const SizedBox(width: 60),
                      // Next/Finish Button
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage == onboardingData.length - 1) {
                              controller.onSkip(); // Navigate to next screen
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orangeColor,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(12),
                          ),
                          child: Icon(
                            _currentPage == onboardingData.length - 1
                                ? Icons.check
                                : Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each onboarding page
class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final Widget title;
  final String subTitle;
  final TextStyle subTitleStyle;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.subTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Expanded(
            flex: 2,
            child: Image.asset(
              'images/$imagePath',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          // Title
          title,
          const SizedBox(height: 20),
          // Subtitle
          Text(
            subTitle,
            style: subTitleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80), // Space for navigation controls
        ],
      ),
    );
  }
}