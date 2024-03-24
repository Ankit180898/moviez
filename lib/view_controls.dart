import 'package:flutter/material.dart';
class ViewControl extends StatelessWidget{
  const ViewControl({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
          children: [
/// First sized box for space
            const SizedBox(width: 100,),
/// Sort by label
            const Text("Sort by ", style: TextStyle(color: Colors.white60,fontSize: 18),),
            const SizedBox(width: 20,),
/// Filter options
            DropdownButton(
              underline: Container(),
              style: const TextStyle(color: Colors.white,),
              iconEnabledColor: Colors.white,
              items: [
                DropdownMenuItem(
                  onTap: (){},
                  child: const Padding( padding: EdgeInsets.all(8.0), child: Text("Duration"),),
                ),
              ],
              onChanged: (selected){},
              autofocus: true,
            )
          ],
        )
    );
  }
}
