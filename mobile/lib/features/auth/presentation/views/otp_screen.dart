import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/assets.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../manager/otp_cubit/otp_cubit.dart';
import '../manager/otp_cubit/otp_states.dart';
import '../widgets/continue_button.dart';
import '../widgets/phone_field.dart';
import '../widgets/verify_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.otpImage,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "OTP Verification",
                      style: AppTextStyles.heading3,
                    ),
                    BlocConsumer<OTPCubit, OTPState>(
                      builder: (context, state) {
                      if(state is OTPSendSuccess || state is OTPVerifyingLoading || state is OTPVerifyFailure || state is OTPVerifySuccess)
                      {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Pinput(
                                  controller: _codeController,
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Didn't receive the code? "),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Resend Code"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                      }else {
                         return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text(
                                "we will send you one-time \n password to this mobile number",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyLargeRegular,
                              ),
                              const SizedBox(height: 48,),
                              PhoneField(
                                phoneController: _phoneController,
                              ),
                            ],
                          ),
                        );
                          
                        }
                        
                        
                      },
                      listener: (context, state) {
                        if (state is OTPVerifySuccess) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Scaffold(
                                body: Center(child: Text("home screen")),
                              ),
                            ),
                          );
                        }
                        if (state is OTPVerifyFailure ||
                            state is OTPSendFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("There is an error")),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<OTPCubit, OTPState>(
                builder: (context, state) {
                   if (state is OTPSendingLoading ||
                            state is OTPVerifyingLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                            }
                  else if (state is OTPSendSuccess) {
                    return VerifyButton(
                      onTap: () {
                        // Verify code logic
                        if(_codeController.text.isNotEmpty){
                          BlocProvider.of<OTPCubit>(context).verify();
                        }
                      },
                    );
                  } else {
                    return ContinueButton(
                      onTap: () {
                        if(_phoneController.text.isNotEmpty){
                          BlocProvider.of<OTPCubit>(context).sendSuccess();
                        }
                        // Send verification logic
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
