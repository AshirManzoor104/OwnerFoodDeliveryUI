import 'package:delivery_owner/ui/main/addDishes.dart';
import 'package:delivery_owner/ui/main/addRestaurants.dart';
import 'package:delivery_owner/ui/main/dishes.dart';
import 'package:delivery_owner/ui/main/dishesAll.dart';
import 'package:delivery_owner/ui/main/driver.dart';
import 'package:delivery_owner/ui/main/map2.dart';
import 'package:delivery_owner/ui/main/restaurants.dart';
import 'package:delivery_owner/ui/main/statistics.dart';
import 'package:flutter/material.dart';
import 'package:delivery_owner/main.dart';
import 'package:delivery_owner/model/order.dart';
import 'package:delivery_owner/ui/main/account.dart';
import 'package:delivery_owner/ui/main/header.dart';
import 'package:delivery_owner/ui/main/map.dart';
import 'package:delivery_owner/ui/main/notification.dart';
import 'package:delivery_owner/ui/main/orders.dart';
import 'package:delivery_owner/ui/menu/help.dart';
import 'package:delivery_owner/ui/menu/language.dart';
import 'package:delivery_owner/ui/main/orderdetails.dart';
import 'package:delivery_owner/ui/menu/menu.dart';

var _mainMap;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() {
    _mainMap = MapScreen();
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  //////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //
  //

  _openMenu(){
    print("Open menu");
    setState(() {
      _scaffoldKey.currentState.openDrawer();
    });
  }

  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  var windowWidth;
  var windowHeight;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _currentPage = "orders";


  @override
  void initState() {
    _initDistance();
    _mainMap.callback = routes;
    account.setRedraw(_redraw);
    super.initState();
  }

  _initDistance() async {
    await ordersSetDistance();
    setState(() {

    });
  }


  _redraw(){
    setState(() {
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    var _headerText = strings.get(21); //
    switch(_currentPage){
      case "addDishes":
        _headerText = strings.get(136); // "Add Dishes",
        break;
      case "editDishes":
        _headerText = strings.get(137); // "Edit Dishes",
        break;
      case "editRestaurant":
        _headerText = strings.get(131); // "Edit Restaurant",
        break;
      case "addRestaurant":
        _headerText = strings.get(106); // "Add new Restaurant",
        break;
      case "statistics":
        _headerText = strings.get(79); // "Statistics",
      break;
      case "orderDetails":
        _headerText = strings.get(56); // "Order Details",
      break;
      case "map":
        _headerText = strings.get(89); // "Map",
      break;
      case "mapRestaurant":
        _headerText = strings.get(89); // "Map",
        break;
      case "language":
        _headerText = strings.get(28); // "Languages",
        break;
      case "account":
        _headerText = strings.get(27); // "Account",
        break;
      case "help":
        _headerText = strings.get(38); // "Help & support",
        break;
      case "notification":
        _headerText = strings.get(25); // "Notifications",
        break;
      case "orders":
        _headerText = strings.get(24); // "Orders",
        break;
      case "drivers":
        _headerText = strings.get(101); // "Change Driver",
        break;
      case "restaurants":
        _headerText = strings.get(105); // "My Restaurants",
        break;
      case "dishes":
        _headerText = strings.get(134); // "My Dishes",
        break;
      case "dishesAll":
        _headerText = strings.get(134); // "My Dishes",
        break;
      default:

        break;
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(context: context, callback: routes,),
      backgroundColor: theme.colorBackground,
      body: Stack(
        children: <Widget>[
          if (_currentPage.isEmpty)
            OrdersScreen(callback: routes),
          if (_currentPage == "dishesAll")
            DishesAllScreen(callback: routes2, params: _params),
          if (_currentPage == "addDishes" || _currentPage == "editDishes")
            AddDishesScreen(callback: routes2, params: _params),
          if (_currentPage == "dishes")
            DishesScreen(callback: routes2, params: _params),
          if (_currentPage == "addRestaurant" || _currentPage == "editRestaurant")
            AddRestaurantScreen(callback: routes2, params: _params),
          if (_currentPage == "mapRestaurant")
            MapInfoScreen(callback: routes2, params: _params),
          if (_currentPage == "restaurants")
            RestaurantsScreen(callback: routes2),
          if (_currentPage == "drivers")
            DriverChangeScreen(callback: routes),
          if (_currentPage == "statistics")
            StatisticsScreen(callback: routes),
          if (_currentPage == "orderDetails")
            OrderDetailsScreen(callback: routes),
          if (_currentPage == "map")
            _mainMap,
          if (_currentPage == "language")
            LanguageScreen(),
          if (_currentPage == "account")
            AccountScreen(callback: routes),
          if (_currentPage == "help")
            HelpScreen(),
          if (_currentPage == "notification")
            NotificationScreen(callback: routes),
          if (_currentPage == "orders")
            OrdersScreen(callback: routes),

          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Header(title: _headerText, onMenuClick: _openMenu, callback: routes)
          ),

        ],
      ),
    );
  }

  Map<String, dynamic> _params = {};

  routes2(String route, Map<String, dynamic> params){
    _params = params;
    if (route != "redraw")
      _currentPage = route;
    setState(() {
    });
  }

  routes(String route){
    _params = {};
    if (route != "redraw")
      _currentPage = route;
    setState(() {
    });
  }

}

