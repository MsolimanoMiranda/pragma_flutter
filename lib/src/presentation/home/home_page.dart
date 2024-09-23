import 'package:challenge_pragma_msolimano/src/domain/models/list_cats.dart';
import 'package:challenge_pragma_msolimano/src/domain/utils/resource.dart';
import 'package:challenge_pragma_msolimano/src/presentation/components/rectangle.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_bloc.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_event.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_state.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/components/card_cat.dart';
import 'package:challenge_pragma_msolimano/src/presentation/shared/constants.dart';
import 'package:challenge_pragma_msolimano/src/presentation/shared/responsive.dart';
import 'package:challenge_pragma_msolimano/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'Home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CatBloc? _bloc;
  final controller = ScrollController();
  int limit = 15;
  bool hasMore = true;
  bool isLoading = false;
  int pageActuality = 0;

  Future refreshValues(String search) async {
    _bloc?.add(FilterChanged(filter: BlocFormItem(value: search)));
    _bloc?.add(PageChanged(page: BlocFormItem(value: 0.toString())));
    setState(() {
      hasMore = true;
      pageActuality = 0;
    });
    await refreshData();
  }

  Future refreshData() async {
    pageActuality = int.tryParse(_bloc!.state.page.value) ?? 0;
    pageActuality++;
    if (_bloc!.state.filter.value.isEmpty) {
      _bloc?.add(
          PageChanged(page: BlocFormItem(value: pageActuality.toString())));
    }

    _bloc?.add(const InitTEvent());
    final responseState = _bloc?.state.response;
    if (responseState is Success) {
      final value = responseState.data as ListCats;

      setState(() {
        if (value.cats.length < limit) {
          hasMore = false;
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        refreshData();
      }
    });
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double widthSize = responsive.wp(100);
    final double heigthSize = responsive.hp(100);
    final double dpSize = responsive.dp(100);
    TextEditingController editingController = TextEditingController();
    _bloc = BlocProvider.of<CatBloc>(context);
    const InputBorder borderA = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(25.0)));
    return RefreshIndicator(
      onRefresh: () async => await refreshValues(''),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    child: Rectangle(
                        heigth: heigthSize / 4.5,
                        width: widthSize,
                        colors: [
                      baseColor,
                      baseColor,
                    ])),
                Positioned(
                    top: heigthSize * 0.08,
                    child: Text(
                      titleScreenBase,
                      style: TextStyle(
                          fontSize: dpSize / 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                Positioned(
                  top: heigthSize * 0.14,
                  width: responsive.wp(80),
                  height: responsive.hp(7),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onSubmitted: (value) async {
                      await refreshValues(value);
                    },
                    controller: editingController,
                    decoration: const InputDecoration(
                        labelText: "Buscar",
                        hintText: "Buscar",
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white70,
                        prefixIconColor: Colors.white,
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        focusedBorder: borderA,
                        enabledBorder: borderA,
                        border: borderA),
                  ),
                ),
              ],
            ),
            BlocBuilder<CatBloc, CatState>(builder: (context, state) {
              if (_bloc!.state.filter.value.isNotEmpty) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: baseColor,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Busco: ${_bloc!.state.filter.value}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            IconButton(
                                iconSize: 30,
                                color: Colors.white,
                                icon: const Icon(Icons.cancel_outlined),
                                onPressed: () async {
                                  _bloc?.add(const FilterChanged(
                                      filter: BlocFormItem(value: '')));
                                  _bloc?.add(const CleanFiter());
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  height: heigthSize * 0.02,
                );
              }
            }),
            BlocListener<CatBloc, CatState>(
              listener: (context, state) {},
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  final responseState = state.response;
                  if (responseState is Loading && !isLoading) {
                    return Stack(
                      children: [
                        Center(
                            child: CircularProgressIndicator(
                          color: Colors.redAccent[200],
                        ))
                      ],
                    );
                  }
                  return Flexible(
                    child: ListView.builder(
                        controller: controller,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: _bloc!.catList.length + 1,
                        itemBuilder: (context, index) {
                          if (index < _bloc!.catList.length) {
                            final item = _bloc!.catList[index];
                            return CardCat(item);
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: hasMore
                                    ? CircularProgressIndicator(
                                        color: Colors.redAccent[200],
                                      )
                                    : _bloc!.catList.length > 10
                                        ? const Text(
                                            'No se econtraron más datos')
                                        : Container(),
                              ),
                            );
                          }
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
