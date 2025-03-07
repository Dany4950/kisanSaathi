// widgets/custom_appbar.dart
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  final Color? titleColor;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final double elevation;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.titleColor,
    this.onBackPressed,
    this.leading,
    this.elevation = 1,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[200],
      title: Text(
        title,
        style: TextStyle(
          color:
              titleColor ?? Theme.of(context).appBarTheme.titleTextStyle?.color,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      elevation: elevation,
      leading: _buildLeading(context),
      actions: actions,
      bottom: bottom,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;

    if (showBackButton && Navigator.canPop(context)) {
      return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      );
    }

    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
      );
}
