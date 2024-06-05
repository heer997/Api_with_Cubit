import "package:api_with_cubit/4rth_Get_API_call_using_Cubit/cubit/cubit_users_state.dart";
import "package:api_with_cubit/4rth_Get_API_call_using_Cubit/cubit/users_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (context) => UsersCubit(),
      child: MaterialApp(
        title: "HomePage",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const FourthHomePage(),
      ),
    );
  }
}

class FourthHomePage extends StatelessWidget {
  const FourthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cubit Example",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersCubit, CubitUserState>(
        builder: (context, state) {
          if (state is CubitUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CubitUserLoaded) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          state.users[index].id.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      title: Text(
                        state.users[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.users[index].username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(state.users[index].address.street),
                          Text(state.users[index].address.zipcode),
                          Text(state.users[index].email),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            );
          }
        },
      ),
    );
  }
}
