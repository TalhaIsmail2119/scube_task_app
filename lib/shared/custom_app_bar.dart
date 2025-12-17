import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const CustomAppBar({Key? key, this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xFF04063E),
            size: 24.r,
          ),
          onPressed: onBackPressed ?? () {},
        ),
      ),
      centerTitle: true,
      title: Text(
        'SCM',
        style: TextStyle(
          color: const Color(0xFF04063E),
          fontWeight: FontWeight.w500,
          fontSize: 16.r,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Stack(
            children: [
              Icon(
                Icons.notifications_none,
                color: const Color(0xFF646984),
                size: 24.r,
              ),
              Positioned(
                right: 2,
                top: 3,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
