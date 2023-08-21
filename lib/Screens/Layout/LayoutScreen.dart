import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/Search/SearchScreen.dart';

import 'package:shop_app/cubit/shop_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: ShopCubit.get(context).bottomNavItems,
            currentIndex: ShopCubit.get(context).currentIndex,
            onTap: (index) {
              ShopCubit.get(context).changeNavCurrentIndex(index);
            },
          ),
          appBar: AppBar(
            title: Text(
              "Salla",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ))
            ],
          ),
          body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex],
        );
      },
    );
  }
}
