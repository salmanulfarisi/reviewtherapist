import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> render(BuildContext context, List children) {
    return ListTile.divideTiles(
        context: context,
        tiles: children.map((dynamic data) {
          return buildListTile(context, data[0], data[1], data[2]);
        })).toList();
  }

  Widget buildListTile(
      BuildContext context, String title, String subtitle, String url) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(url);
      },
      isThreeLine: true,
      dense: false,
      leading: null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // DateTime moonLanding = DateTime.parse("1969-07-20");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: ListView(
        children: render(context, [
          ["Horizontal", "Scroll Horizontal", "/example01"],
          ["Vertical", "Scroll Vertical", "/example02"],
          ["Fraction", "Fraction style", "/example03"],
          ["Custom Pagination", "Custom Pagination", "/example04"],
          ["Phone", "Phone view", "/example05"],
          ["ScrollView ", "In a ScrollView", "/example06"],
          ["Custom", "Custom all properties", "/example07"]
        ]),
      ),
    );
  }
}

const List<String> titles = [
  "Flutter Swiper is awosome",
  "Really nice",
  "Yeap"
];

class ExampleHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ExampleHorizontal"),
        ),
        body: Swiper(
          loop: false,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          indicatorLayout: PageIndicatorLayout.SCALE,
          autoplay: true,
          autoplayDelay: 1000,
          itemCount: images.length,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          fade: 1.0,
          viewportFraction: 0.85,
        ));
  }
}

class ExampleVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ExampleVertical"),
        ),
        body: Swiper(
          loop: false,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          pagination: const SwiperPagination(alignment: Alignment.centerRight),
          control: const SwiperControl(),
        ));
  }
}

class ExampleFraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ExampleFraction"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Swiper(
              indicatorLayout: PageIndicatorLayout.SLIDE,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: images.length,
              pagination:
                  const SwiperPagination(builder: SwiperPagination.fraction),
              control: const SwiperControl(),
            )),
            Expanded(
                child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: images.length,
              scrollDirection: Axis.vertical,
              pagination: const SwiperPagination(
                  alignment: Alignment.centerRight,
                  builder: SwiperPagination.fraction),
            ))
          ],
        ));
  }
}

class ExampleCustomPagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom Pagination"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(
                    margin: const EdgeInsets.all(0.0),
                    builder: SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return ConstrainedBox(
                        child: Container(
                            color: Colors.white,
                            child: Text(
                              "${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}",
                              style: const TextStyle(fontSize: 20.0),
                            )),
                        constraints: const BoxConstraints.expand(height: 50.0),
                      );
                    })),
                control: const SwiperControl(),
              ),
            ),
            Expanded(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(
                    margin: const EdgeInsets.all(0.0),
                    builder: SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return ConstrainedBox(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}",
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: const DotSwiperPaginationBuilder(
                                        color: Colors.black12,
                                        activeColor: Colors.black,
                                        size: 10.0,
                                        activeSize: 20.0)
                                    .build(context, config),
                              ),
                            )
                          ],
                        ),
                        constraints: const BoxConstraints.expand(height: 50.0),
                      );
                    })),
                control: const SwiperControl(color: Colors.redAccent),
              ),
            )
          ],
        ));
  }
}

class ExamplePhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone"),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              "images/bg.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Swiper.children(
            autoplay: true,
            pagination: const SwiperPagination(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                    size: 20.0,
                    activeSize: 20.0)),
            children: <Widget>[
              Image.asset(
                "images/1.png",
                fit: BoxFit.contain,
              ),
              Image.asset(
                "images/2.png",
                fit: BoxFit.contain,
              ),
              Image.asset("images/3.png", fit: BoxFit.contain)
            ],
          )
        ],
      ),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  final Widget? child;
  final String? title;
  final List<Widget>? actions;

  const ScaffoldWidget({this.child, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        actions: actions,
      ),
      body: child,
    );
  }
}

class ExampleCustom extends StatefulWidget {
  const ExampleCustom({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExampleCustomState();
  }
}

class _ExampleCustomState extends State<ExampleCustom> {
  //properties want to custom
  int _itemCount = 0;

  bool _loop = false;

  bool _autoplay = false;

  int _autoplayDely = 0;

  double _padding = 0;

  bool _outer = false;

  double _radius = 0;

  double _viewportFraction = 0;

  late SwiperLayout _layout;

  int _currentIndex = 0;

  late double _scale;

  late Axis _scrollDirection;

  late Curve _curve;

  late double _fade;

  late bool _autoplayDisableOnInteraction;

  late CustomLayoutOption customLayoutOption;

  Widget _buildItem(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_radius)),
      child: Image.asset(
        images[index % images.length],
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void didUpdateWidget(ExampleCustom oldWidget) {
    customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
        .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(
            [Offset(-370.0, -40.0), Offset(0.0, 0.0), Offset(370.0, -40.0)]);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
        .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate(
            [Offset(-350.0, 0.0), Offset(0.0, 0.0), Offset(350.0, 0.0)]);
    _fade = 1.0;
    _currentIndex = 0;
    _curve = Curves.ease;
    _scale = 0.8;
    _controller = SwiperController();
    _layout = SwiperLayout.TINDER;
    _radius = 10.0;
    _padding = 0.0;
    _loop = true;
    _itemCount = 3;
    _autoplay = false;
    _autoplayDely = 3000;
    _viewportFraction = 0.8;
    _outer = false;
    _scrollDirection = Axis.horizontal;
    _autoplayDisableOnInteraction = false;
    super.initState();
  }

// maintain the index

  Widget buildSwiper() {
    return Swiper(
      onTap: (int index) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("New page"),
            ),
            body: Container(),
          );
        }));
      },
      customLayoutOption: customLayoutOption,
      fade: _fade,
      index: _currentIndex,
      onIndexChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      curve: _curve,
      scale: _scale,
      itemWidth: 300.0,
      controller: _controller,
      layout: _layout,
      outer: _outer,
      itemHeight: 200.0,
      viewportFraction: _viewportFraction,
      autoplayDelay: _autoplayDely,
      loop: _loop,
      autoplay: _autoplay,
      itemBuilder: _buildItem,
      itemCount: _itemCount,
      scrollDirection: _scrollDirection,
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
      pagination: const SwiperPagination(
        builder: DotSwiperPaginationBuilder(
            size: 10.0, activeSize: 10.0, space: 5.0),
      ),
    );
  }

  late SwiperController _controller;
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.black87,
        child: SizedBox(
            height: 300.0, width: double.infinity, child: buildSwiper()),
      ),
      Expanded(
          child: ListView(
        children: <Widget>[
          Text("Index:$_currentIndex"),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _controller.previous(animation: true);
                },
                child: const Text("Prev"),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.next(animation: true);
                },
                child: const Text("Next"),
              ),
              Expanded(
                  child: TextField(
                controller: numberController,
              )),
              ElevatedButton(
                onPressed: () {
                  var text = numberController.text;
                  setState(() {
                    _currentIndex = int.parse(text);
                  });
                },
                child: const Text("Update"),
              ),
            ],
          ),
          FormWidget(
              label: "layout",
              child: FormSelect<SwiperLayout>(
                placeholder: "Select layout",
                value: _layout,
                values: const [
                  SwiperLayout.DEFAULT,
                  SwiperLayout.STACK,
                  SwiperLayout.TINDER,
                  SwiperLayout.CUSTOM
                ],
                valueChanged: (SwiperLayout value) {
                  _layout = value;
                  setState(() {});
                },
              )),
          FormWidget(
            label: "scrollDirection",
            child: Switch(
                value: _scrollDirection == Axis.horizontal,
                onChanged: (bool value) => setState(() => _scrollDirection =
                    value ? Axis.horizontal : Axis.vertical)),
          ),
          FormWidget(
            label: "autoplayDisableOnInteractio",
            child: Switch(
                value: _autoplayDisableOnInteraction,
                onChanged: (bool value) =>
                    setState(() => _autoplayDisableOnInteraction = value)),
          ),
          //Pannel Begin
          FormWidget(
            label: "loop",
            child: Switch(
                value: _loop,
                onChanged: (bool value) => setState(() => _loop = value)),
          ),
          FormWidget(
            label: "outer",
            child: Switch(
                value: _outer,
                onChanged: (bool value) => setState(() => _outer = value)),
          ),
          //Pannel Begin
          FormWidget(
            label: "autoplay",
            child: Switch(
                value: _autoplay,
                onChanged: (bool value) => setState(() => _autoplay = value)),
          ),

          FormWidget(
            label: "padding",
            child: NumberPad(
              number: _padding,
              step: 5.0,
              min: 0.0,
              max: 30.0,
              onChangeValue: (num value) {
                _padding = value.toDouble();
                setState(() {});
              },
            ),
          ),
          FormWidget(
            label: "scale",
            child: NumberPad(
              number: _scale,
              step: 0.1,
              min: 0.0,
              max: 1.0,
              onChangeValue: (num value) {
                _scale = value.toDouble();
                setState(() {});
              },
            ),
          ),
          FormWidget(
            label: "fade",
            child: NumberPad(
              number: _fade,
              step: 0.1,
              min: 0.0,
              max: 1.0,
              onChangeValue: (num value) {
                _fade = value.toDouble();
                setState(() {});
              },
            ),
          ),
          FormWidget(
            label: "itemCount",
            child: NumberPad(
              number: _itemCount,
              step: 1,
              min: 0,
              max: 100,
              onChangeValue: (num value) {
                _itemCount = value.toInt();
                setState(() {});
              },
            ),
          ),

          FormWidget(
            label: "radius",
            child: NumberPad(
              number: _radius,
              step: 1.0,
              min: 0.0,
              max: 30.0,
              onChangeValue: (num value) {
                _radius = value.toDouble();
                setState(() {});
              },
            ),
          ),

          FormWidget(
            label: "viewportFraction",
            child: NumberPad(
              number: _viewportFraction,
              step: 0.1,
              max: 1.0,
              min: 0.5,
              onChangeValue: (num value) {
                _viewportFraction = value.toDouble();
                setState(() {});
              },
            ),
          ),

          FormWidget(
              label: "curve",
              child: FormSelect<Curve>(
                  placeholder: "Select curve",
                  value: _layout,
                  values: const [
                    Curves.easeInOut,
                    Curves.ease,
                    Curves.bounceInOut,
                    Curves.bounceOut,
                    Curves.bounceIn,
                    Curves.fastOutSlowIn
                  ],
                  valueChanged: (Curve value) {
                    _curve = value;
                    setState(() {});
                  })),
        ],
      ))
    ]);
  }
}

class ExampleSwiperInScrollView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<ExampleSwiperInScrollView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation10;
  late Animation<double> _animation11;
  late Animation<double> _animation12;
  late Animation<double> _animation13;

  _ExampleState();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    _animation10 = Tween(begin: 0.0, end: 1.0).animate(controller);
    _animation11 = Tween(begin: 0.0, end: 1.0).animate(controller);
    _animation12 = Tween(begin: 0.0, end: 1.0).animate(controller);
    _animation13 = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.animateTo(1.0, duration: const Duration(seconds: 3));
    super.initState();
  }

  Widget _buildDynamicCard() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        ScaleTransition(
                          scale: _animation10,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 160.0),
                        ),
                        ScaleTransition(
                          scale: _animation11,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 160.0),
                        ),
                        ScaleTransition(
                          scale: _animation12,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        ScaleTransition(
                          scale: _animation13,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                  ]),
              Container(
                padding: const EdgeInsets.all(10.0),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate((c, i) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                    scale: 0.8,
                    fade: 0.8,
                    itemBuilder: (c, i) {
                      return Container(
                        color: Colors.grey,
                        child: Text("$i"),
                      );
                    },
                    itemCount: 10,
                    pagination: const SwiperPagination(),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                      scale: 0.8,
                      fade: 0.8,
                      itemBuilder: (c, i) {
                        return Container(
                          color: Colors.grey,
                          child: Text("$i"),
                        );
                      },
                      pagination: const SwiperPagination(
                          builder: SwiperPagination.fraction),
                      itemCount: 0),
                ),
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                      scale: 0.8,
                      fade: 0.8,
                      itemBuilder: (c, i) {
                        return Container(
                          color: Colors.grey,
                          child: Text("$i"),
                        );
                      },
                      pagination: const SwiperPagination(
                          builder: SwiperPagination.fraction),
                      itemCount: 10000),
                ),
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                      outer: true,
                      scale: 0.8,
                      fade: 0.8,
                      itemBuilder: (c, i) {
                        return Container(
                          color: Colors.grey,
                          child: Text("$i"),
                        );
                      },
                      pagination: const SwiperPagination(),
                      itemCount: 10),
                ),
                const Text("Image from network"),
                SizedBox(
                  height: 300.0,
                  child: Swiper(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                          "https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=87d6daed02f41bd5c553eef461d881a0/f9198618367adab4b025268587d4b31c8601e47b.jpg");
                    },
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                      outer: true,
                      scale: 0.8,
                      fade: 0.8,
                      itemBuilder: (c, i) {
                        return Card(
                          elevation: 2.0,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(
                                child: Image.network(
                                    "https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=87d6daed02f41bd5c553eef461d881a0/f9198618367adab4b025268587d4b31c8601e47b.jpg"),
                              ),
                              FractionalTranslation(
                                translation: Offset(0.0, 0.0),
                                child: Container(
                                  alignment: const FractionalOffset(0.0, 0.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.lightBlue.withOpacity(0.5),
                                      width: 100.0,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                //padding: const EdgeInsets.only(bottom:10.0),
                                margin: const EdgeInsets.all(140.0),

                                child: const Icon(Icons.location_on,
                                    color: Colors.white, size: 25.0),
                              ),
                            ],
                          ),
                        );
                      },
                      pagination: const SwiperPagination(
                          alignment: Alignment.topCenter),
                      itemCount: 10),
                ),
                SizedBox(
                  height: 400.0,
                  child: Swiper(
                      outer: true,
                      itemBuilder: (c, i) {
                        return _buildDynamicCard();
                      },
                      pagination: const SwiperPagination(
                          alignment: Alignment.topCenter),
                      itemCount: 10),
                ),
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                      outer: true,
                      fade: 0.8,
                      viewportFraction: 0.8,
                      scale: 0.8,
                      itemBuilder: (c, i) {
                        return Container(
                          color: Colors.grey,
                          child: Text("$i"),
                        );
                      },
                      pagination: const SwiperPagination(
                          alignment: Alignment.topCenter),
                      itemCount: 10),
                ),
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}

const List<String> images = [
  "assets/avaters/Avatar 1.jpg",
  "assets/avaters/Avatar 2.jpg",
  "assets/avaters/Avatar 3.jpg",
];

class FormWidget extends StatelessWidget {
  final String label;

  final Widget? child;

  const FormWidget({required this.label, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(label, style: const TextStyle(fontSize: 14.0)),
            Expanded(
                child: Align(alignment: Alignment.centerRight, child: child))
          ],
        ));
  }
}

class FormSelect<T> extends StatefulWidget {
  final String placeholder;
  final ValueChanged<T> valueChanged;
  final List<dynamic> values;
  final dynamic value;

  const FormSelect(
      {required this.placeholder,
      required this.valueChanged,
      this.value,
      required this.values});

  @override
  State<StatefulWidget> createState() {
    return _FormSelectState();
  }
}

class _FormSelectState extends State<FormSelect> {
  int _selectedIndex = 0;

  @override
  void initState() {
    for (int i = 0, c = widget.values.length; i < c; ++i) {
      if (widget.values[i] == widget.value) {
        _selectedIndex = i;
        break;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String placeholder = widget.placeholder;
    List<dynamic> values = widget.values;

    return Container(
      child: InkWell(
        child: Text(_selectedIndex < 0
            ? placeholder
            : values[_selectedIndex].toString()),
        onTap: () {
          _selectedIndex = 0;
          showBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: values.length * 30.0 + 200.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: values.length * 30.0 + 70.0,
                        child: CupertinoPicker(
                          itemExtent: 30.0,
                          children: values.map((dynamic value) {
                            return Text(value.toString());
                          }).toList(),
                          onSelectedItemChanged: (int index) {
                            _selectedIndex = index;
                          },
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_selectedIndex >= 0) {
                              widget
                                  .valueChanged(widget.values[_selectedIndex]);
                            }

                            setState(() {});

                            Navigator.of(context).pop();
                          },
                          child: const Text("ok"),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}

class NumberPad extends StatelessWidget {
  final num number;
  final num step;
  final num max;
  final num min;
  final ValueChanged<num> onChangeValue;

  const NumberPad(
      {required this.number,
      required this.step,
      required this.onChangeValue,
      required this.max,
      required this.min});

  void onAdd() {
    onChangeValue(number + step > max ? max : number + step);
  }

  void onSub() {
    onChangeValue(number - step < min ? min : number - step);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(icon: const Icon(Icons.exposure_neg_1), onPressed: onSub),
        Text(
          number is int ? number.toString() : number.toStringAsFixed(1),
          style: const TextStyle(fontSize: 14.0),
        ),
        IconButton(icon: const Icon(Icons.exposure_plus_1), onPressed: onAdd)
      ],
    );
  }
}
