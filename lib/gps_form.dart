import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GpsForm extends StatelessWidget{

  List<Marker> marker =[

    Marker(markerId: MarkerId('user_marker'),position: LatLng(30.077468,31.285200))
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
       Navigator.of(context).pushReplacementNamed('loc');

      },
      child:Scaffold(
     body: Container(
       child: GoogleMap(
        
         initialCameraPosition: CameraPosition(
         target:LatLng(30.077468,31.285200),
         zoom:10.0,),
         mapType: MapType.normal,
          markers: Set.from(marker),
      )
       ),
       ),
       );
       
     
                   

    
  }


}
