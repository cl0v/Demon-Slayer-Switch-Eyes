import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(home: CupertinoSwitchDemo()));
}

class CupertinoSwitchDemo extends StatefulWidget {
  const CupertinoSwitchDemo({super.key});

  @override
  State<CupertinoSwitchDemo> createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo>
    with RestorationMixin {
  final RestorableBool _switchValue = RestorableBool(false);
  final RestorableBool _switchValueB = RestorableBool(true);

  @override
  String get restorationId => 'cupertino_switch_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_switchValue, 'switch_value');
    registerForRestoration(_switchValueB, 'switch_valueB');
  }

  onChanged(value) {
    setState(() {
      _switchValue.value = value;
    });
  }
  final int factor = 32;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              child: Opacity(
                opacity: .5,
                child: Image.asset(
                  'assets/demon.png',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Center(
            child: Semantics(
              container: true,
              label: 'Teste',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns:  AlwaysStoppedAnimation(factor / 360),
                        child: CustomSwitch(
                          value: _switchValue.value,
                          onChanged: onChanged,
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 2,
                        child: RotationTransition(
                          turns:  AlwaysStoppedAnimation(180 - factor / 360),
                          child: CustomSwitch(
                            value: _switchValue.value,
                            onChanged: onChanged,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                          turns:  AlwaysStoppedAnimation(factor/2 / 360),
                          child:  CustomSwitch(
                          value: _switchValue.value,
                          onChanged: onChanged,
                        ),
                      ),
                   const    SizedBox(width: 16),
                      RotatedBox(
                          quarterTurns: 2,
                          child: RotationTransition(
                          turns:  AlwaysStoppedAnimation(-factor /2 / 360),
                          child:  CustomSwitch(
                              value: _switchValue.value,
                              onChanged: onChanged,
                            ),
                          )),
                    ],
                  ),
                  // Disabled switches
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns:  AlwaysStoppedAnimation(-factor / 360),
                        child: CustomSwitch(
                          value: _switchValue.value,
                          onChanged: onChanged,
                        ),
                      ),

                      RotatedBox(
                        quarterTurns: 2,
                        child: RotationTransition(
                          turns:  AlwaysStoppedAnimation(factor / 360),
                          child: CustomSwitch(
                            value: _switchValue.value,
                            onChanged: onChanged,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, this.value, this.onChanged});

  final value;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      thumbColor: Colors.yellow.shade200,
      activeColor: Colors.red.shade600,
    );
  }
}
