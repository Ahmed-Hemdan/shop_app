import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Models/CategoriesModel.dart';
import 'package:shop_app/Models/FavoritsModel.dart';
import 'package:shop_app/Models/HomeModel.dart';
import 'package:shop_app/Models/onboardingModel.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

Widget onboardingWidget(OnboardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(model.title),
        SizedBox(
          height: 15.h,
        ),
        Text(model.body),
      ],
    );

Widget defaultTextFormField({
  bool scure = false,
  required TextEditingController controller,
  required TextInputType type,
  required Icon icon,
  required String hint,
  required String? Function(String?) validate,
  void Function()? sufBut,
  IconData? sufIcon,
}) =>
    SizedBox(
      child: TextFormField(
        validator: validate,
        obscureText: scure,
        obscuringCharacter: "*",
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          prefixIcon: icon,
          suffixIcon: IconButton(icon: Icon(sufIcon), onPressed: sufBut),
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );

Widget defaultButton({
  required void Function()? onpressed,
  Color color = Colors.blue,
  required String text,
}) =>
    SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );

Future<bool?> showtoast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );

Widget mySlider(HomeModel? model) => CarouselSlider(
      items: model!.data!.banners!
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage("${e.image}"),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        clipBehavior: Clip.antiAlias,
        height: 180.h,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 900),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );

Widget homeListItem({
  required context,
  required HomeModel? model,
  required int index,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.cyan[300]!.withOpacity(0.20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: NetworkImage("${model!.data!.products![index].image}", scale: 1),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            if (model.data!.products![index].discount != 0)
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  "Discount ",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
              ),
            Text(
              "${model.data!.products![index].name}",
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '${model.data!.products![index].price}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (model.data!.products![index].discount != 0)
                      Text(
                        '${model.data!.products![index].oldPrice}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    ShopCubit.get(context).makeProductInFavorits(index);
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: model.data!.products![index].inFavorites == true ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget categoriesListItem(
  CategoriesModel model,
  int index,
) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.cyan[300]!.withOpacity(0.20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: NetworkImage('${model.data!.categoryData![index].image}'),
                  ),
                ),
              ),
            ),
            Text("${model.data!.categoryData![index].name}"),
          ],
        ),
      ),
    );
Widget favoritsListItem(FavoritsModel model, int index, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.cyan[300]!.withOpacity(0.20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  height: 100.h,
                  width: 100.w,
                  image: NetworkImage(
                    '${model.data!.data![index].product!.image}',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.data!.data![index].product!.name}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text("${model.data!.data![index].product!.price}"),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                ShopCubit.get(context).deleteProductFromFavorits(index);
                ShopCubit.get(context).getHomeData();
                model.data!.data!.removeAt(index);
                ShopCubit.get(context).getFavoritsData();
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );

Widget profileItem(IconData icon, String text , void Function()? fun) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan[400]!.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed:fun,
                icon: const Icon(
                  Icons.edit,
                  size: 23,
                ),
              ),
            ],
          ),
        ),
      ),
    );
