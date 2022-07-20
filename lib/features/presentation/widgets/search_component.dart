import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            // Expanded(
            //   child: TextField(
            //     controller: controller,
            //     focusNode: focusNode,
            //     style: Styles.textoPesquisa,
            //     cursorColor: Styles.cursorPesquisaCor,
            //     decoration: BoxDecoration(),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: controller.clear,
            //   child: const Icon(
            //     CupertinoIcons.clear_thick_circled,
            //     color: Styles.iconePesquisaCor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
