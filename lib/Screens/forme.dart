import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forme extends StatefulWidget {
  const Forme({super.key});

  @override
  State<Forme> createState() => _FormeState();
}

class _FormeState extends State<Forme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage("https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Price ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Name of ',
                          style: TextStyle(color: Colors.grey[800], fontSize: 20.sp),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart_rounded,
                              size: 30,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
