import 'package:flutter/material.dart';
import '../models/car.dart';
import '../components/car_card.dart';
import '../pages/car_detail_screen.dart'; // Импортируем экран деталей автомобиля

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
          crossAxisCount: 2, // Количество столбцов
          childAspectRatio: 0.8, // Соотношение сторон карточек
          crossAxisSpacing: 10, // Пробел между столбцами
          mainAxisSpacing: 10, // Пробел между строками
        ),
        itemCount: favoriteCars.length,
        itemBuilder: (context, index) {
          final car = favoriteCars[index];
          return CarCard(
            car: car,
            onDeleteCar: () => toggleFavorite(car), // Удаляем из избранного
            onToggleFavorite: () => toggleFavorite(car), // Передаем функцию для переключения избранного
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(
                    car: car,
                    onDeleteCar: () => toggleFavorite(car), // Передаем функцию удаления
                  ),
                ),
              );
            }, // Добавляем обработчик нажатия
          );
        },
      ),
    );
  }
}
