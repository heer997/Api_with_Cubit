import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/Models/post_model.dart";
import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/cubit/post_fetch_cubit.dart";
import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/repository/api_repository.dart";
import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/service/api_service.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(MyApp(apiServiceThird: ApiServiceThird()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiServiceThird});

  final ApiServiceThird apiServiceThird;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
          create: (context) {
            return PostFetchCubit(
              apiRepositoryThird: ApiRepositoryThird(
                apiServiceThird: apiServiceThird,
              ),
            )..fetchPostApi();
          },
        ),
      ],
      child: MaterialApp(
        title: "HomePage",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Api Fetch with Cubit",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if (state is PostFetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetchError) {
            return Center(
              child: Text(state.failure.message),
            );
          } else if (state is PostFetchLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const Center(
                    child: Text(
                      "No any POST",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final Post singlePost = postList[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              singlePost.id.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                          title: Text(
                            singlePost.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(singlePost.body),
                        ),
                      );
                    },
                  );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
