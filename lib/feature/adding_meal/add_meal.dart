import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sandwichy/core/router/app_routes.dart';
import 'package:sandwichy/core/style/app_text_styles.dart';
import 'package:sandwichy/feature/adding_meal/widgets/text_field_widget.dart';
import 'package:sandwichy/models/meal_model.dart';
import 'package:sandwichy/widgets/spacing_widgets.dart';
import '../../core/style/appColors.dart';
import '../../database/dp_helper.dart';

class AddMeal extends StatefulWidget {
  AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _urlController;
  TextEditingController? _rateController;
  TextEditingController? _timeController;
  TextEditingController? _descController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _rateController = TextEditingController();
    _timeController = TextEditingController();
    _urlController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _descController?.dispose();
    _nameController?.dispose();
    _urlController?.dispose();
    _timeController?.dispose();
    _rateController?.dispose();
    super.dispose();
  }

  void addDummyMeal() async {
    await DatabaseHelper.instance.addMeal(
      MealModel(
        title: _nameController!.text,
        description: _descController!.text,
        imageUrl: _urlController!.text,
        rate:double.tryParse(_rateController!.text) ?? 0.0,
        time: _timeController!.text,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeightSpace(40),
              Row(
                children: [
                  WidthSpace(10),
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  WidthSpace(100),
                  Text(
                    "Add Meal",
                    style: AppTextStyles.cardTitle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              HeightSpace(20),
              SizedBox(
                  height: 585.h,
                  width: 327.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeightSpace(8),
                      Text("Meal Name", style: AppTextStyles.cardTitle),
                      HeightSpace(8),
                      TextFieldWidget(
                        hintText: "Enter a meal name",
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter meal name ";
                          }
                        },
                      ),
                      HeightSpace(8),
                      Text("Meal URL", style: AppTextStyles.cardTitle),
                      HeightSpace(8),
                      TextFieldWidget(
                        hintText: "Enter a meal url",
                        controller: _urlController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter meal url ";
                          }
                        },
                      ),
                      HeightSpace(8),
                      Text("Rate", style: AppTextStyles.cardTitle),
                      HeightSpace(8),
                      TextFieldWidget(
                        hintText: "Enter a meal rate",
                        controller: _rateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter meal rate ";
                          }
                        },
                      ),
                      HeightSpace(8),
                      Text("Time", style: AppTextStyles.cardTitle),
                      HeightSpace(8),
                      TextFieldWidget(
                        hintText: "Enter a meal name",
                        controller: _timeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter meal time to be ready ";
                          }
                        },
                      ),
                      HeightSpace(8),
                      Text("Description", style: AppTextStyles.cardTitle),
                      HeightSpace(8),
                      TextFieldWidget(
                        hintText: "Enter a meal description",
                        controller: _descController,
                        maxLines: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter meal description ";
                          }
                        },
                      ),
                    ],
                  ),
                ),
              HeightSpace(60),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    addDummyMeal();
                    setState(() {
                    });
                    final snackBar = SnackBar(
                      content: const Text('Meal Added Successfully!'),
                      backgroundColor: AppColors.primaryColor,
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {
                        },
                      ),
          
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.homeScreen);
                  }
                },
                child: Container(
                  width: 300.w,
                  height: 40.h,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.primaryColor,
                  ),
                  child: Text(
                    "Save",
                    style: AppTextStyles.cardTitle.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
