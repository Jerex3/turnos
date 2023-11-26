import 'package:flutter/material.dart';
import 'package:tnpd/core/config/service_locator.dart';
import 'package:tnpd/core/presentation/input/custom_outlined_button.dart';
import 'package:tnpd/core/presentation/styles/text_styles.dart';
import 'package:tnpd/global/cubit/auth/auth_cubit.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final authCubit = sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          buildDrawerHeader(),
          Spacer(),
          CustomOutlinedButton(child: Center(child: Text("Salir")), onPressed: authCubit.signOutGoogle,)
        ],
      )
    );
  }

  DrawerHeader buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(),
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                   backgroundImage: NetworkImage(authCubit.state.userCredential!.photoURL!),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: Center(child: Text(authCubit.state.userCredential!.displayName!, overflow: TextOverflow.clip, style: TextStyles.h2,)))
            ],
          )
        );
  }
}
