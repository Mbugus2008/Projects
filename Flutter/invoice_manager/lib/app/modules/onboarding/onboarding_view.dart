import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    onPressed: controller.skipToLogin,
                    child: const Text('Skip'),
                  ),
                ),
              ),
              
              // Page Content
              Expanded(
                child: PageView.builder(
                  itemCount: controller.pages.length,
                  onPageChanged: (index) => controller.currentPage.value = index,
                  itemBuilder: (context, index) {
                    final page = controller.pages[index];
                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Icon(
                              page.icon,
                              size: 60,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          
                          const SizedBox(height: 48),
                          
                          // Title
                          Text(
                            page.title,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Description
                          Text(
                            page.description,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              // Page Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.pages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentPage.value == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Navigation Buttons
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    // Previous Button
                    if (controller.currentPage.value > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: controller.previousPage,
                          child: const Text('Previous'),
                        ),
                      ),
                    
                    if (controller.currentPage.value > 0)
                      const SizedBox(width: 16),
                    
                    // Next/Get Started Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value ? null : controller.nextPage,
                        child: controller.isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text(
                                controller.currentPage.value == controller.pages.length - 1
                                    ? 'Sign in with Microsoft'
                                    : 'Next',
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

