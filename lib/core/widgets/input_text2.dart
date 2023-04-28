import 'package:flutter/material.dart';
import 'package:admin_ui/core/util/size_config.dart';

class ProfileCard extends StatelessWidget {
  final String? tittle;
  final Icon? icon;
  final TextEditingController textEditingController;
  void Function()? onTap;


  ProfileCard(
      {super.key,
      this.tittle,
      this.icon,
      required this.textEditingController,
      this.onTap
      });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$tittle")),
                TextFormField(
                  onTap: onTap,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
                      iconColor: Theme.of(context).colorScheme.primary,
                      prefixIcon: icon),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
