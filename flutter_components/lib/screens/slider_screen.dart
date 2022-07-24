import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app.theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sliders and Checks')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Slider.adaptive(
                activeColor: AppTheme.primary,
                  min: 50,
                  max: 400,
                  value: _sliderValue,
                  onChanged: _sliderEnabled 
                    ? ( value ) {
                    _sliderValue = value;
                    setState(() {});
                  }
                  : null,
                ),
                // Checkbox(
                //   value: _sliderEnabled, 
                //   onChanged: ( value ) {
                //     _sliderEnabled = value ?? true;
                //     setState(() {});
                //   }
                // ),
                // Switch(
                //   value: _sliderEnabled, 
                //   onChanged: ( value ) => setState(() { _sliderEnabled = value; })
                // ),
                CheckboxListTile(
                  activeColor: AppTheme.primary,
                  title: const Text('Turn on/off the slider'),
                  value: _sliderEnabled, 
                  onChanged: ( value ) => setState(() { _sliderEnabled = value ?? true; })
                ),
                SwitchListTile.adaptive(
                  activeColor: AppTheme.primary,
                  title: const Text('Turn on/off the slider'),
                  value: _sliderEnabled, 
                  onChanged: ( value ) => setState(() { _sliderEnabled = value; })
                ),

                const AboutListTile(),
                Image(
                  image: const NetworkImage('https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGNhdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
            ],
          ),
        ));
  }
}
