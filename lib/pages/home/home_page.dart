import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../Model/DatabaseHelper.dart';
import '../../Model/Receipt.dart';
import '../../Services/EdamamApiService.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController textEditingController = TextEditingController();

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  EdamamApiService edamamApi = EdamamApiService();
  List<dynamic> recipes = [];

  static List<String> searchQueries = [
    'pasta',
    'chicken',
    'soup',
    'vegan',
    'dessert',
    'meat',
    'fish',
    'cake',
    'kofte',
    'egg',
    'cheese',
    'salad',
    'tomato',
    'burger',
    'pizza',
    'patato'
  ];

  Future<void> fetchRecipes() async {
    final response = await http.get(Uri.parse(edamamApi.url));
    final json = jsonDecode(response.body);
    setState(() {
      recipes = json['hits'].map((hit) => hit['recipe']).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 64.0),

          // ----- Textos do topo da página ----- //
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Qual o prato de hoje?',
                    style: AppTextStyles.titulo
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Busque suas receitas e as favorite\nfacilmente em alguns passos',
                    style:
                        AppTextStyles.emailSenha.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30.0),

          // ----- Campo de pesquisa por receitas ----- //
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                        cursorColor: AppColors.gradienteEscuro,
                        onChanged: (value) async {
                          await fetchRecipes();
                          setState(() {
                            edamamApi.query = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.gradienteClaro),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.gradienteClaro),
                                borderRadius: BorderRadius.circular(10.0)),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Procurar receitas',
                                    style: TextStyle(
                                        color: AppColors.gradienteClaro)
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.search, color: AppColors.gradienteClaro),
                                ),
                              ],
                            ),
                            suffix: IconButton(
                              onPressed: () async {
                                setState(() {
                                  edamamApi.query = textEditingController.text;
                                });
                                await fetchRecipes();
                                textEditingController.clear();
                              },
                              icon: Icon(Icons.search,
                                  color: AppColors.gradienteClaro),
                            )),
                        controller: textEditingController,
                        style: TextStyle(color: AppColors.gradienteClaro)),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              int randomIndex =
                                  Random().nextInt(searchQueries.length);
                              edamamApi.query = searchQueries[randomIndex];
                              fetchRecipes();
                            });
                          },
                          child: Text("Receita aleatória",
                              style:
                                  TextStyle(color: AppColors.gradienteClaro)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ----- Campo receitas aleatórias ----- //
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        List<Color> buttonColors =
                            List.filled(recipes.length, Colors.indigo);
                        final recipe = recipes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            subtitle: Text(
                                "${recipe['calories'].toString().substring(0, 7)} kcal ",
                                style: TextStyle(color: AppColors.cinzaEscuro)),
                            title: Text(recipe['label'].toString(),
                                style:
                                    TextStyle(color: AppColors.gradienteClaro)),
                            children: [
                              Card(
                                color: AppColors.cinzaClaro,
                                child: Column(
                                  children: [
                                    ListTile(
                                      trailing: IconButton(
                                        onPressed: () async {
                                          await Provider.of<DatabaseHelper3>(
                                                  context,
                                                  listen: false)
                                              .add(
                                                  Receipt(
                                                      Name: recipe['label'],
                                                      ingredients: recipe[
                                                              'ingredientLines']
                                                          .toString(),
                                                      urlImage: recipe['image']
                                                          .toString()));
                                          setState(() {
                                            buttonColors[index] = Colors.pink;
                                          });
                                        },
                                        icon: Icon(Icons.bookmark_outline,
                                            color: AppColors.gradienteClaro),
                                      ),
                                      title: Text(recipe['label']),
                                      subtitle: Text(recipe['source']),
                                    ),
                                    Column(
                                      children: [
                                        Image.network(recipe['image']),
                                        const SizedBox(height: 10.0),
                                        Text("Ingredientes",
                                            style: TextStyle(
                                              color: AppColors.gradienteEscuro,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              recipe['ingredientLines'].length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ' - ' +
                                                    recipe['ingredientLines']
                                                        [index],
                                                style: TextStyle(
                                                    color: AppColors
                                                        .gradienteEscuro,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: IconButton(
                                                onPressed: () async {
                                                  await Share.share(
                                                      '${recipe['label']}\n${recipe['ingredientLines'].toString().replaceAll('[', '   ').toString().replaceAll(']', '')}');
                                                },
                                                icon: Icon(
                                                  Icons.share,
                                                  color: AppColors.gradienteClaro,
                                                  size: 35,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ],
      ),

      // ----- Bottom navegation bar ----- //
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: AppColors.gradienteClaro,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark_outline,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
