import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginSignupModal extends StatefulWidget {
  const LoginSignupModal({
    super.key,
  });

  @override
  State<LoginSignupModal> createState() => _LoginSignupModalState();
}

class _LoginSignupModalState extends State<LoginSignupModal> {
  bool _rememberMe = true;
  bool _isAuthenticating = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Gap(10),
          Container(
            width: 69,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(255, 234, 234, 234),
            ),
          ),
          const Gap(32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Email address',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Gap(9),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value ?? '')) {
                    return null;
                  }
                  return 'Enter a correct email';
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 243, 243, 243),
                  hintText: 'Enter Your email',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(16, 24, 40, .34),
                  ),
                  prefixIcon: SizedBox.square(
                    dimension: 24,
                    child: SvgPicture.asset(
                      'assets/icons/mail.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) =>
                    setState(() => _rememberMe = value ?? false),
                activeColor: const Color.fromARGB(255, 230, 231, 238),
                checkColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: WidgetStateBorderSide.resolveWith(
                  (states) => const BorderSide(
                    color: Color.fromARGB(255, 0, 10, 84),
                    width: 1,
                  ),
                ),
                // side: const ,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _rememberMe = !_rememberMe;
                }),
                child: const Text(
                  'Remember me',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 133, 144, 168),
                  ),
                ),
              )
            ],
          ),
          const Gap(21),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: const Color.fromARGB(255, 61, 61, 61),
                disabledForegroundColor:
                    const Color.fromRGBO(255, 255, 255, 0.1),
                backgroundColor: const Color.fromARGB(255, 61, 61, 61),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: _isAuthenticating
                  ? null
                  : () async {
                      if (_formKey.currentState?.validate() != true) {
                        return;
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() => _isAuthenticating = true);
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() => _isAuthenticating = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Row(
                            children: [
                              Text('Login Successful'),
                            ],
                          ),
                        ),
                      );
                    },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    'Login/Signup',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  if (_isAuthenticating)
                    const CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 12,
                    )
                ],
              ),
            ),
          ),
          const Gap(25),
          const Row(
            children: [
              Expanded(
                child: Divider(),
              ),
              Gap(15),
              Text(
                'or continue with',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Gap(15),
              Expanded(child: Divider()),
            ],
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: SvgPicture.asset('assets/icons/google.svg'),
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                child: SvgPicture.asset('assets/icons/facebook.svg'),
              )
            ],
          ),
          const Gap(28),
        ],
      ),
    );
  }
}
