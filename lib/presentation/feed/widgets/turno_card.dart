import 'dart:math';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tnpd/core/presentation/styles/text_styles.dart';
import 'package:tnpd/domain/models/turno.dart';

class TurnoCard extends StatelessWidget {

  final Turno turno;
  final onTap;
  const TurnoCard({super.key, required this.turno, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
          color: Colors.white,
          child: InkWell(
            enableFeedback: true,
            onTap: (){ context.push("/turno/", extra: turno); },
            child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                      color: Random().nextBool() ? Colors.amber : Colors.teal,
                      height: 120,
                      width: 120,
                      child: Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            turno.startAt.hour.toString().padLeft(2, '0') + ":" + turno.startAt.minute.toString().padLeft(2, '0'),
                            style: TextStyles.h1,
                          ),
                          Text(turno.place.name),
                          if(turno.place.photo != "")
                            CircleAvatar(
                              radius: 16,
                              child: ClipRect(child: Image.network(turno.place.photo), ),
                            )
                        ],
                      )),
                    ),
                    Container(
                      width:165,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.sports_tennis,
                                size: 18,
                              ),
                              Text(turno.duration)
                            ]),
                          const SizedBox(height: 5),
                          
                            Row(
                              children: [
                              const Icon(
                                Icons.person,
                                size: 18,
                              ),
                              Text(turno.persons.toString())
                            ]),
                            const SizedBox(height: 5),
                            Text(turno.place.courtDescription, overflow: TextOverflow.ellipsis, maxLines: 2,)
                          ]),
                    ), 
                    const Spacer(),
                    SizedBox(
                      height: 120,
                      child: Container(
                        decoration: DottedDecoration(
                            linePosition: LinePosition.left
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("\$ ${turno.price.floor()}", style: TextStyle(fontSize: 20)),
                            Text("\$${(turno.price/turno.persons).floor()} c/u", style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                    )
            ]),
          ),
        );
  }
}