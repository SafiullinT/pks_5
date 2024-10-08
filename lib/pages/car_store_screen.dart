import 'package:flutter/material.dart';
import '../models/car.dart';
import 'add_car_screen.dart';
import '../components/car_card.dart';
import 'car_detail_screen.dart'; // Импортируйте экран деталей автомобиля

class CarStoreScreen extends StatefulWidget {
  final List<Car> cars;
  final Function addCar;
  final Function toggleFavorite;

  CarStoreScreen({required this.cars, required this.addCar, required this.toggleFavorite});

  @override
  _CarStoreScreenState createState() => _CarStoreScreenState();
}

class _CarStoreScreenState extends State<CarStoreScreen> {
  void _deleteCar(Car car) {
    setState(() {
      widget.cars.remove(car); // Удаляем машину из списка
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Store'),
      ),
      body: widget.cars.isEmpty
          ? Center(child: Text('Нет автомобилей в магазине'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Количество столбцов
          childAspectRatio: 0.8, // Соотношение сторон карточек
          crossAxisSpacing: 10, // Пробел между столбцами
          mainAxisSpacing: 10, // Пробел между строками
        ),
        itemCount: widget.cars.length,
        itemBuilder: (context, index) {
          final car = widget.cars[index];
          return CarCard(
            car: car,
            onDeleteCar: () => _deleteCar(car), // Передаем функцию удаления
            onToggleFavorite: () => widget.toggleFavorite(car),
            // Удаляем нажатие на карточку, добавляем переход на экран деталей
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(
                    car: car,
                    onDeleteCar: () => _deleteCar(car), // Передаем функцию удаления
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCarScreen(onAddCar: widget.addCar),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
