import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sandwichy/core/router/app_routes.dart';
import 'package:sandwichy/core/style/appColors.dart';
import 'package:sandwichy/core/style/app_text_styles.dart';
import 'package:sandwichy/feature/home_scr/widgets/custom_food_item.dart';
import 'package:sandwichy/feature/home_scr/widgets/custom_top_home_screen.dart';
import 'package:sandwichy/widgets/spacing_widgets.dart';
import '../../database/dp_helper.dart';
import '../../models/meal_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<MealModel> meals = [];
  late Future<void> mealsFuture;
  Future loadMeals() async {
    meals = await DatabaseHelper.instance.getAllMeals();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
   mealsFuture= loadMeals();
    //deleteMeals();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.addMeal);
          loadMeals();
        },
        child: Icon(Icons.add, color: AppColors.primaryColor, size: 24.sp),
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor, width: .5.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTopHomeScreen(),
          HeightSpace(15),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Your Food",
              style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future:mealsFuture,
                builder: (context, AsyncSnapshot snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
              }
              else if(snapshot.hasError){
                return Icon(Icons.error,size: 40,color: Colors.red,);
              }
              else{
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 210,
                  ),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return GestureDetector(
                      onLongPress: (){
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          btnOkText: "Yes",
                          title: 'Warning!',
                          desc: 'Are you want to delete this meal?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            DatabaseHelper.instance.deleteMealById(meal.id!);
                            final snackBar = SnackBar(
                              content: const Text('Meal deleted Successfully!'),
                              backgroundColor: AppColors.primaryColor,
                              action: SnackBarAction(
                                label: 'Ok',
                                onPressed: () {
                                  setState(() {

                                  });
                                },
                              ),

                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            loadMeals();
                            setState(() {

                            });
                          },
                        )..show();
                      },
                      onTap: (){
                        GoRouter.of(context).pushNamed(AppRoutes.mealDetails,extra: meal);

                      },
                      child: CustomFoodItem(
                        imageUrl: meal.imageUrl.toString(),
                        title: meal.title.toString(),
                        rate: meal.rate,
                        time: meal.time.toString(),
                      ),
                    );
                  },
                );
              }





            })
          ),
        ],
      ),
    );
  }
}
