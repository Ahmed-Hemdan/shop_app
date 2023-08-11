import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).favoritsData == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : RefreshIndicator(
                onRefresh: () {
                  ShopCubit.get(context).favoritsData = null;
                 return ShopCubit.get(context).getFavoritsData();
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ShopCubit.get(context).favoritsData!.data!.data!.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return favoritsListItem(ShopCubit.get(context).favoritsData!, index , context);
                  },
                ),
              );
      },
    );
  }
}
