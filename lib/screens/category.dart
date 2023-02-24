import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixaplus/data/data.dart';
import 'package:pixaplus/model/categorymodel.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<categorymodel> categories = [];

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Categories",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          LottieBuilder.asset(
            "assets/lottie/category.json",
            height: 100,
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 510,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CategorieTile(
                      imgUrl: categories[index].imgUrl,
                      title: categories[index].catname);
                }),
          )
        ],
      )),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String imgUrl, title;
  CategorieTile({required this.imgUrl, required this.title});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imgUrl,
                  height: 200,
                  width: 400,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(20)),
            // color: Colors.blac,
            alignment: Alignment.center,
            height: 200,
            width: 400,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
