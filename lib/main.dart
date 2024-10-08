import 'package:flutter/material.dart';
import 'pages/car_store_screen.dart';
import 'pages/add_car_screen.dart';
import 'pages/favorite_cars_screen.dart';
import 'pages/profile_screen.dart';
import 'models/car.dart';

void main() {
  runApp(CarStoreApp());
}

class CarStoreApp extends StatefulWidget {
  @override
  _CarStoreAppState createState() => _CarStoreAppState();
}

class _CarStoreAppState extends State<CarStoreApp> {
  int _currentIndex = 0;
  List<Car> cars = [
    Car(
      'Tesla Model S',
      'https://www.zr.ru/d/story/c4/924100/tesla-model-s-samyj-dalnobojnyj-elektromobil.jpg',
      79999,
      'Электрический седан с невероятным запасом хода и высокой производительностью.',
      '1020',
      '2.1',
      'Электрический',
      '322',
    ),
    Car(
      'BMW M5',
      'https://a.d-cd.net/ZwAAAgFaWeA-1920.jpg',
      100000,
      'Доработанная подразделением BMW Motorsport версия автомобиля BMW пятой серии. Первое поколение было представлено в 1986 году.',
      '727',
      '3',
      'Бензиновый',
      '350',
    ),
  ];

  List<Car> favoriteCars = [];

  void addCar(Car newCar) {
    setState(() {
      cars.add(newCar);
    });
  }

  void toggleFavorite(Car car) {
    setState(() {
      if (favoriteCars.contains(car)) {
        favoriteCars.remove(car);
        car.isFavorite = false;
      } else {
        favoriteCars.add(car);
        car.isFavorite = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      CarStoreScreen(cars: cars, addCar: addCar, toggleFavorite: toggleFavorite),
      FavoriteCarsScreen(favoriteCars: favoriteCars, toggleFavorite: toggleFavorite),
      ProfileScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Магазин',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}
