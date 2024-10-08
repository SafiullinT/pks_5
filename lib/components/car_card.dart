import 'package:flutter/material.dart';
import '../models/car.dart';
import '../pages/car_detail_screen.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onDeleteCar;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap; // Добавлено для обработки нажатия на карточку

  CarCard({
    required this.car,
    required this.onDeleteCar,
    required this.onToggleFavorite,
    required this.onTap, // Инициализируем обработчик нажатия
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell( // Используем InkWell для обработки нажатия
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Выравниваем содержимое по левому краю
          children: [
            // Изображение автомобиля
            Container(
              height: 130, // Установите высоту для изображения
              width: double.infinity, // Ширина изображения на всю ячейку
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: Image.network(
                  car.imageUrl,
                  fit: BoxFit.cover, // Изображение заполняет контейнер
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name, // Название автомобиля
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4), // Пробел между названием и ценой
                  Text(
                    '\$${car.price.toStringAsFixed(2)}', // Цена автомобиля
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(car.isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: onToggleFavorite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
