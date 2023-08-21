import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, states) {},
          builder: (context, states) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                defaultTextFormField(
                  
                    controller: searchController,
                    type: TextInputType.text,
                    icon: const Icon(Icons.search),
                    hint: "Search",
                    validate: (value) {
                      if (value!.isEmpty)
                        return "Can't be empty !!!!!!!";
                      else {
                        null;
                      }
                    },
                    onSubmit: (text) {
                      ShopCubit.get(context).getSearch(text);
                    }),
                SizedBox(
                  height: 5.h,
                ),
                if (states is GetSearchLoading) const LinearProgressIndicator(),
                SizedBox(
                  height: 5.h,
                ),
                if (states is GetSearchSuccess)
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: ShopCubit.get(context).searchData!.data!.data!.length,
                      itemBuilder: (context, index) {
                        return searchListItem(ShopCubit.get(context).searchData!, index, context);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
