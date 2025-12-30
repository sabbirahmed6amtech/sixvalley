import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';
import 'package:sixvalley/core/constant/app_typography.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Container(
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
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'What are you looking for?',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
