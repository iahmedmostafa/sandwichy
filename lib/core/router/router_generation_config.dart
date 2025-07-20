import 'package:go_router/go_router.dart';
import 'package:sandwichy/core/router/app_routes.dart';
import 'package:sandwichy/feature/adding_meal/add_meal.dart';
import 'package:sandwichy/feature/home_scr/home_screen.dart';
import 'package:sandwichy/feature/meal_details/meal_details.dart';
import 'package:sandwichy/feature/on_boarding/on_boarding_screen.dart';

import '../../models/meal_model.dart';

class RouterGenerationConfig {

  static GoRouter goRouter=GoRouter(
  initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
          path:AppRoutes.onBoardingScreen,
         name: AppRoutes.onBoardingScreen,
        builder: (context,state)=>OnBoardingScreen(),
      ),
      GoRoute(
          path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context,state)=>HomeScreen(),

      ),
      GoRoute(
        path:AppRoutes.mealDetails,
        name: AppRoutes.mealDetails,
        builder: (context,state) {
          final meal = state.extra as MealModel;
          return MealDetails(mealModel: meal);
        }
      ),
      GoRoute(
        path: AppRoutes.addMeal,
        name: AppRoutes.addMeal,
        builder: (context,state)=>AddMeal(),

      )


    ]

  );
}