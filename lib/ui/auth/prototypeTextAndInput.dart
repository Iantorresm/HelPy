import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fPrototypeTextAndInput extends StatefulWidget {
  final String content;
  final String thisTitle;
  final Icon? thisIcon;
  final ValueSetter? onChanged;
  // final VoidCallback onChanged;
  final bool thisEnableSuggestions;
  final bool thisObscureText;
  final bool thisAutocorrect;

  const fPrototypeTextAndInput(
    {
      super.key,
      required this.content,
      required this.thisTitle,
      this.thisIcon,
      this.onChanged,
      required this.thisEnableSuggestions,
      required this.thisObscureText,
      required this.thisAutocorrect,
    }
  );

  @override
  State<fPrototypeTextAndInput> createState() => _fPrototypeTextAndInput();
}



class _fPrototypeTextAndInput extends State<fPrototypeTextAndInput> {
  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Wrap(
                  children: [
                    widget.thisIcon == null ? SizedBox() : widget.thisIcon!,
                    Text(
                      widget.thisTitle,
                      style: GoogleFonts.imprima(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: widget.content,
                    hintStyle: GoogleFonts.imprima(),
                    fillColor: Colors.black,
                  ),
                  onChanged: (value){
                    widget.onChanged!(value);
                  },
                  enableSuggestions: widget.thisEnableSuggestions,
                  obscureText: widget.thisObscureText,
                  autocorrect: widget.thisAutocorrect,
                ),
              ),
            ]
          ),
        ],
      );
  }
}