import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Models/HomeModel.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ShopCubit.get(context).homeData == null
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      mySlider(ShopCubit.get(context).homeData),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: MasonryGridView.builder(
                            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: ShopCubit.get(context).homeData!.data!.products!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: justForTry(
                                context: context,
                                model: ShopCubit.get(context).homeData,
                                index: index,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
