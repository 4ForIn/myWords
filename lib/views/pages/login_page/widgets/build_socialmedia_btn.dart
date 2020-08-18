import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuilSocialMediaBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final BuildContext context;
  final IconData icon;
  final Color iconColor;

  const BuilSocialMediaBtn({
    this.onPressed,
    this.context,
    this.icon,
    this.iconColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        height: 11.2 * SizeConfig.imageSizeMultiplier, //46
        width: 11.2 * SizeConfig.imageSizeMultiplier, //46
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: InkWell(
          onTap: onPressed, //() => onPressed(context, icon)
          borderRadius: BorderRadius.circular(30.0),
          child: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}
