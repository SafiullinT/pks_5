import 'package:flutter/material.dart';
import '../models/car.dart';
import '../components/car_card.dart';
import '../pages/car_detail_screen.dart';

class FavoriteCarsScreen extends StatelessWidget {
  final List<Car> favoriteCars;
  final Function toggleFavorite;

  FavoriteCarsScreen({required this.favoriteCars, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: favoriteCars.isEmpty
          ? Center(child: Text('Нет избранных автомобилей'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: favoriteCars.length,
        itemBuilder: (context, index) {
          final car = favoriteCars[index];
          return CarCard(
            car: car,
            onDeleteCar: () => toggleFavorite(car),
            onToggleFavorite: () => toggleFavorite(car),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(
                    car: car,
                    onDeleteCar: () => toggleFavorite(car),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
