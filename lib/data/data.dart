import 'package:wallpaperstudio/model/categoriesmodel.dart';

List<CategoriesModel> getCategories(){
  List<CategoriesModel> cat = [];
  CategoriesModel categoriesModel=new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/3977529/pexels-photo-3977529.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName="Street Art";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/247502/pexels-photo-247502.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName="WildLife";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/241316/pexels-photo-241316.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName="Cars";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/2317475/pexels-photo-2317475.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName="Bikes";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/21696/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName="Motivation";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/1105766/pexels-photo-1105766.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName="City";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName="Mountains";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/374703/pexels-photo-374703.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName="window";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.categoriesurl="https://images.pexels.com/photos/5875024/pexels-photo-5875024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName="God";
  cat.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  return cat;
}