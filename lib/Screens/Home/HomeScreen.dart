import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ShopCubit.get(context).homeData == null || ShopCubit.get(context).categoriesData == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mySlider(ShopCubit.get(context).homeData),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Categories",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: ShopCubit.get(context).categoriesData!.data!.categoryData!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            color: Colors.cyan[300]!.withOpacity(0.2),
                            width: 100.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image(
                                    width: 100.w,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                    image: NetworkImage('${ShopCubit.get(context).categoriesData!.data!.categoryData![index].image}'),
                                  ),
                                ),
                                Text(
                                  "${ShopCubit.get(context).categoriesData!.data!.categoryData![index].name}",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "New Products",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: MasonryGridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: ShopCubit.get(context).homeData!.data!.products!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: homeListItem(
                          context: context,
                          model: ShopCubit.get(context).homeData,
                          index: index,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
