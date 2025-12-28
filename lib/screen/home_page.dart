import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightColorScheme.primary,
        toolbarHeight: 5,
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: AppColors.lightColorScheme.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, Welcome 👋",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: AppColors.lightColorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            "Albert Stevano",
                            style: TextStyle(
                              color: AppColors.lightColorScheme.onPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.lightColorScheme.onPrimary,
                        child: const Text('AH'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Explore", style: TextStyle(color: AppColors.lightColorScheme.onPrimary),),SizedBox(width: 5),
                      Text("Sports", style: TextStyle(color: AppColors.lightColorScheme.onPrimary),),
                      Text("Explore", style: TextStyle(color: AppColors.lightColorScheme.onPrimary),),
                      Text("Explore", style: TextStyle(color: AppColors.lightColorScheme.onPrimary),),
                      Text("Explore", style: TextStyle(color: AppColors.lightColorScheme.onPrimary),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
