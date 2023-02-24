import 'package:pixaplus/model/categorymodel.dart';

List<categorymodel> getCategories() {
  List<categorymodel> categories = [];
  categorymodel categoriesmodel = new categorymodel();

//
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.catname = 'Street Art';
  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  //
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.catname = "Wild Life";
  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  //
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.catname = "Nature";
  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  //
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.catname = "City";
  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  //
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesmodel.catname = "Motivation";

  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  //
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.catname = "Bikes";
  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  //
  categoriesmodel.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.catname = "Cars";
  categories.add(categoriesmodel);
  categoriesmodel = new categorymodel();

  return categories;
}
