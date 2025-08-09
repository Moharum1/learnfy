import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnfy/core/routing/app_routes.dart';
import 'package:learnfy/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:learnfy/features/auth/presentation/manager/otp_cubit/otp_states.dart';
import 'package:learnfy/features/auth/presentation/widgets/otp_widgets/otp_phone_field.dart';
import 'package:learnfy/features/auth/presentation/widgets/otp_widgets/otp_verification_form.dart';
import 'package:learnfy/features/auth/presentation/widgets/primary_button.dart';
import '../../../../core/res/app_images.dart';
import '../../../../core/theme/app_text_styles.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  bool _isOnFirstPage = true;

  final PageController _pageController = PageController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              width: double.infinity,
              AppImages.otpImage,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "OTP Verification",
              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  
                  OTPPhoneField(
                    phoneController:_phoneController 
                  ),
                  OTPVerificationField(
                    codeController: _codeController,
                    phoneNumber: "01550855405"
                  )
                  
                ],
              ),
            ),
            BlocConsumer<OTPCubit , OTPState>(
              builder: (context, state) {
                if(state is OTPVerifyLoading){
                  return Center(child: CircularProgressIndicator());
                } 
                else{
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: PrimaryButton(
                      onPressed: (){
                        if(_isOnFirstPage){
                          _pageController.nextPage(
                            duration: Duration(
                              milliseconds: 250
                            ), 
                            curve: Curves.linear
                          );
                          setState(() {
                            _isOnFirstPage = false;
                          });
                          if(_phoneController.text.isNotEmpty){
                            // Send OTP Code

                          }
                        }
                        else{
                          // Verify OTP Code
                          Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
                        }
                    
                      }, 
                      text: _isOnFirstPage ? "GET OTP" : "Verify",
                    ),
                  );
                }
              },
              listener: (context , state){
                ScaffoldMessenger.of(context).clearSnackBars();
                if(state is OTPVerifySuccess){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("go to home"))
                  );
                  return;
                }

                if(state is OTPVerifyFailure){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("YOUR CODE IS WRONG"))
                  );
                  return;
                }
              }
            )
          ],
        ),
      ),
    );
  }
}