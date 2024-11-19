import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:myapp/components/login_signup_modal.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 44, 
                              width: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: SvgPicture.asset('assets/icons/headphones.svg'),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.light_mode),
                              onPressed: () {
                                // Add theme toggle functionality
                              },
                            ),
                          ],
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: SvgPicture.asset(
                            'assets/illustrations/illustration.svg',
                            width: 269,
                          ),
                        ),
                        const Gap(35),
                        const SlideTransition(
                          position: AlwaysStoppedAnimation(Offset.zero),
                          child: Text(
                            'Boost Your Productivity,\nSimplify Your Day',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Gap(20),
                        Text(
                          'Join thousands of users managing their tasks efficiently',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialLoginButton(
                              icon: 'assets/icons/google.svg',
                              onPressed: () {
                                // Google login logic
                              },
                            ),
                            const SizedBox(width: 20),
                            _socialLoginButton(
                              icon: 'assets/icons/apple.svg',
                              onPressed: () {
                                // Apple login logic
                              },
                            ),
                          ],
                        ),
                        const LoginSignupModal(),
                        const Gap(40),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Add help center navigation
                            },
                            child: const Text('Need Help?'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _socialLoginButton({
    required String icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: SvgPicture.asset(icon),
        onPressed: onPressed,
      ),
    );
  }
}
