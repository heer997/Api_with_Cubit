import "package:api_with_cubit/2nd_API_call_using_Cubit/API_services/api_services.dart";
import "package:api_with_cubit/2nd_API_call_using_Cubit/Cubits/user_login_cubit.dart";
import "package:api_with_cubit/2nd_API_call_using_Cubit/Cubits/user_login_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login screen",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                BlocProvider(
                  create: (context) => UserLoginCubit(),
                  child: BlocConsumer<UserLoginCubit, UserLoginState>(
                    listener: (context, state) {
                      print(state);
                    },
                    builder: (context, state) {
                      if (state is UserLoginLoaded) {
                        print(state.loginModel.token);
                      }
                      return ElevatedButton(
                        onPressed: () {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            context.read<UserLoginCubit>().userLogin(
                                emailController.text.toString(),
                                passwordController.text.toString());
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: const Size(200.0, 50.0),
                          shape: const LinearBorder(),
                        ),
                        child: state is UserLoginLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Continue",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
