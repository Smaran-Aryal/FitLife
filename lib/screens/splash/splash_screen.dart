import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/primary_button.dart';
import '../main_shell.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background photo
          Image.asset('assets/images/splash_bg.jpg', fit: BoxFit.cover),
          // 2. Gradient so text stays readable and blends into the theme
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.45, 0.8],
                colors: [
                  Colors.transparent,
                  Color(0x99101010),
                  AppColors.background,
                ],
              ),
            ),
          ),

          // 3. Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  _buildLogo(),
                  const Spacer(),
                  _buildHeadline(),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    label: 'Get Started',
                    icon: Icons.arrow_forward,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => const MainShell(),
                          transitionsBuilder: (_, animation, __, child) =>
                              FadeTransition(opacity: animation, child: child),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildLoginRow(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        const Icon(Icons.eco, size: 56, color: AppColors.primary),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            children: [
              TextSpan(text: 'Fit', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'Life', style: TextStyle(color: AppColors.primary)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Better Health  •  Happier You',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildHeadline() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Small Steps',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, height: 1.2),
          ),
          Text(
            'Big Changes',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Your journey to a healthier\nand stronger you starts here.',
            style: TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?  ',
            style: TextStyle(color: Colors.white, fontSize: 13)),
        Text('Log In',
            style: TextStyle(
                color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );

  }
}