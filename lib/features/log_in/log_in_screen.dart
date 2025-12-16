

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_route/app_routes.dart';
import '../../config/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      context.goNamed(AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.primaryBackground,
      body: Stack(
        children: [
          /// ---------------- Header Section ----------------
          Container(
            height: 0.42.sh,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 41.w),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  width: 96.w,
                  height: 98.h,
                  fit: BoxFit.contain,
                ),
                Gap(20.h),
                Text(
                  'SCUBE',
                  style: TextStyle(
                    fontSize: 24.r,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Gap(4.h),
                Text(
                  'Control & Monitoring System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.r,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          /// ---------------- Login Section ----------------
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.58.sh,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(12.w, 32.h, 12.w, 24.h),
              decoration: BoxDecoration(
                color: AppTheme.surfaceBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.08),
                //     blurRadius: 20,
                //     offset: const Offset(0, -6),
                //   ),
                // ],
              ),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.r,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textOnPrimary,
                          ),
                        ),
                      ),
                      Gap(24.h),
                      /// Username
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: AppTheme.texttirtiary,
                          fontSize: 16.r,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 14.r,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.texttirtiary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppTheme.primaryBorder,// default border
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Username is required';
                          }
                          if (value.trim().length < 3) {
                            return 'Minimum 3 characters required';
                          }
                          return null;
                        },
                      ),
                      Gap(12.h),

                      /// Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: TextStyle(
                          fontSize: 14.r,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.texttirtiary,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 14.r,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.texttirtiary,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppTheme.primaryBorder,// default border
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Minimum 6 characters required';
                          }
                          return null;
                        },
                      ),
                      Gap(8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      Gap(20.h),
                      SizedBox(
                        width: 336.w,
                        height: 60.h,
                        child: ElevatedButton(
                          onPressed: _onLogin,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.r,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                      ),
                      Gap(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                fontSize: 14.r,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
