import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_pragma_msolimano/src/domain/models/cat.dart';
import 'package:challenge_pragma_msolimano/src/presentation/components/rectangle.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/components/back_arrow.dart';
import 'package:challenge_pragma_msolimano/src/presentation/shared/constants.dart';
import 'package:challenge_pragma_msolimano/src/presentation/shared/responsive.dart';
import 'package:flutter/material.dart';

class CatDetails extends StatelessWidget {
  static const String routeName = 'Detail';
  Cat catInfo;
  CatDetails(this.catInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double widthSize = responsive.wp(100);
    final double heigthSize = responsive.hp(100);
    final double dpSize = responsive.dp(100);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  child: Rectangle(
                      heigth: heigthSize / 6,
                      width: widthSize,
                      colors: [
                    baseColor,
                    baseColor,
                  ])),
              BackArrow(),
              Positioned(
                  top: heigthSize * 0.08,
                  left: heigthSize * 0.14,
                  child: Text(
                    catInfo.name ?? '',
                    style: TextStyle(
                        fontSize: dpSize / 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ],
          ),
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                width: 260,
                height: 350,
                memCacheWidth: 260,
                memCacheHeight: 330,
                imageUrl: catInfo.image?.url ?? '',
                placeholder: (context, url) => CircularProgressIndicator(
                  color: Colors.redAccent[200],
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          )),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  rowData('Descripción: ', catInfo.description ?? ''),
                  rowData('Origen: ', catInfo.origin ?? ''),
                  rowData('Temperamento: ', catInfo.temperament ?? ''),
                  rowData(
                      'Otros Nombres: ',
                      catInfo.altNames!.isEmpty
                          ? 'No se Encontro info.'
                          : catInfo.altNames ?? ''),
                  rowData('Tamaño: ', catInfo.weight?.metric ?? ''),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rowData(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ))
        ],
      ),
    );
  }
}
