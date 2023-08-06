import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/Components/Components.dart';

import 'package:shop_app/cubit/shop_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).categoriesData == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: ShopCubit.get(context).categoriesData!.data!.categoryData!.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return categoriesListItem(ShopCubit.get(context).categoriesData! ,index);
                },
              );
      },
    );
  }
}
