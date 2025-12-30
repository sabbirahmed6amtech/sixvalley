import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSearchTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hintText;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onSearchTap,
    this.onChanged,
    this.onSubmitted,
    this.hintText = 'What are you looking for?',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.black
            : AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(hintText: hintText),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(onPressed: onSearchTap, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
