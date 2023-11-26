
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tnpd/core/config/service_locator.dart';
import 'package:tnpd/global/cubit/auth/auth_cubit.dart';
import 'package:tnpd/presentation/auth/auth_login.dart';

class AuthCheck extends StatelessWidget {

   final authCubit = sl<AuthCubit>();
   
  AuthCheck({super.key}){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authCubit.checkAuthStatus();
    },);
  }
 

  @override
  Widget build(BuildContext context) {
    return Center(
            child: TextButton(onPressed: () {
              authCubit.checkAuthStatus();
            }, child:  Text("data")),
        );
  }
}