import 'package:flutter/material.dart';
import 'package:flutter_side_project/controllers/note-controller.dart';
import 'package:flutter_side_project/widgets/custom-button.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  _CustomAppbarState createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool visableSearch = false;
  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 10,
        title: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                widget.title,
                style: TextStyle(color: theme.secondaryColor, fontSize: 30),
              ),
            ),
            visableSearch
                ? Expanded(
                    flex: 6,
                    child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: theme.secondaryColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextField(
                          controller: searchFieldController,
                          onChanged: (value) {
                            search(value);
                          },
                        )),
                  )
                : const SizedBox(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  iconSymbol: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      if (visableSearch) searchFieldController.clear();
                      visableSearch = !visableSearch;
                    });
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
