import 'package:flutter/material.dart';
import '../models/car.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;
  final VoidCallback onDeleteCar; // Добавляем параметр для удаления автомобиля

  CarDetailScreen({required this.car, required this.onDeleteCar}); // Обновленный конструктор

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Покажите диалоговое окно для подтверждения удаления
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Удалить автомобиль?'),
                    content: Text('Вы уверены, что хотите удалить ${car.name}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Закрываем диалог
                        },
                        child: Text('Отмена'),
                      ),
                      TextButton(
                        onPressed: () {
                          onDeleteCar(); // Вызываем функцию удаления
                          Navigator.of(context).pop(); // Закрываем диалог
                          Navigator.of(context).pop(); // Возвращаемся назад после удаления
                        },
                        child: Text('Удалить'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(car.imageUrl, width: 300, height: 200),
            SizedBox(height: 20),
            Text(
              car.description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Цена: ${car.price} \$',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Характеристики:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Мощность: ${car.horsepower} л.с', style: TextStyle(fontSize: 16)),
            Text('Разгон до 100 км/ч: ${car.acceleration} с', style: TextStyle(fontSize: 16)),
            Text('Тип двигателя: ${car.engineType}', style: TextStyle(fontSize: 16)),
            Text('Максимальная скорость: ${car.maxSpeed} км/ч', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
