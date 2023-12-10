import 'package:flutter/material.dart';
import 'package:mealsapp/data/datas.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/favorites.dart';
import 'package:mealsapp/screens/meal_list.dart';
import 'package:mealsapp/widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  // Stful widgetlarda => context globaldir
  // Stless widgetlarda => Sadece build fonksiyonunda context'e erişilebilir.
  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealList(
            meals: meals
                .where((element) => element.categoryId == category.id)
                .toList())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          SizedBox(height: 25),
                    Text("Kategoriler", textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.food_bank_outlined, color: Colors.purple),
              SizedBox(width: 7,),
              Text("Başlangıçlar"),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.food_bank_outlined,
                color: Colors.pink,
              ),
                     SizedBox(width: 7,),
              Text("Ara Sıcaklar"),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.food_bank_outlined,
                color: Colors.yellow,
              ),
                     SizedBox(width: 7,),
              Text("Ana Yemekler"),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.food_bank_outlined,
                color: Colors.red,
              ),
                     SizedBox(width: 7,),
              Text("Tatlılar"),
              SizedBox(height: 15),
            ],
          ),
        ],
      )),
      appBar: AppBar(
        title: const Text("Bir kategori seçin"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const Favorites()));
                },
              ))
        ],
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2),
          children: [
            for (final category in categories)
              CategoryCard(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
      ),
    );
  }
}
// LMS => Learning Management System