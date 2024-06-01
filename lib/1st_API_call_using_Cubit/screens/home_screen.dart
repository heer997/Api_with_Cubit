import "package:api_with_cubit/1st_API_call_using_Cubit/cubits/user_details_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return UserDetailsCubit();
      },
      child: MaterialApp(
        title: "HomeScreen",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserDetailsCubit>().getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomeScreen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listener: (context, state) {
          return print(state);
        },
        builder: (context, state) {
          if (state is UserDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDetailsError) {
            return Center(
              child: Text(
                state.errormsg,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            );
          } else if (state is UserDetailsLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.usersDetailsModels.users!.length,
              itemBuilder: (context, index) {
                final data = state.usersDetailsModels.users![index];
                print(data);
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data.image.toString()),
                    ),
                    title: Text(
                      data.firstName.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(data.hair!.color.toString()),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
