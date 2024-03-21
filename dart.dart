// var num1 = 100;
// dynamic num2 = 100;
//
// void main(List<String> args) {
//   print("num1==num2:${(num1 == num2)}"); //true
// }

// final 和 const区别
// final 和 const 都可以定义一个不变的量，但是final在未初始化的时候可以定义和初始化步骤分开，但是const 定义时就需要给予初始值
//
// const num3 = 100;
// const int num4 = 100;
// final num5 = 100;
// final int num6 = 100;
// final int num7;//报错，final定义的参数要么给予初始值，要么在函数域中定义后面再给予初始值
// num7 = 100;

// void main(List<String> args) {
//   final int num8;
//   num8 = 100;

//   print(
//       "num3==num4==num5==num6==num8:${num3 == num4},${num4 == num5},${num5 == num6},${num6 == num8}");
// }

//数据类型

// int num9 = 100; //10进制,-2^63 ～ 2^63 - 1
// int num10 = 0x0100; //16进制数
// double num11 = 100;
// double num12 = 1.42e5;
// num num13 = 100;

// String string1 = '123';
// String string2 = "123";
// String string3 = '''1
// 2
// 3''';

// String? string4 = null;
// String string5 = "123\n456\n789";
// String string6 = r"123\n456\n789";

// bool flag1 = true;

// void main(List<String> args) {
//   bool? flag2;
//   print(
//       "string1:$string1,string2:$string2,string3:$string3,string4:$string4,string5:${string5},string6:${string6}");
//   print(
//       "num9:${num9},num10:${num10},num11:${num11},num12:${num12},num13:${num13}");
//   print("flag1:${flag1},flag2:${flag2}");
// }

//集合类型
// var numList1 = [1, 2, 3];
// var stringList1 = ["1", "2", "3"];
// List<num>? numList2 = [1, 2.0, 3.00];
// var stringNumMap1 = <String, String>{"1": "1", "2": "2", "3": "3"};
// Map<String, num> stringNumMap2 = {"1": 1, "2": 2, "3": 3};
// var stringSet1 = <String>{"1", "1", "2"};
// Set<String> stringSet2 = {"1", "1", "2"};

// void main(List<String> args) {
//   print("numList1:${numList1.map((e) => e + 1)}");
//   print("stringList1:${stringNumMap2..clear()}");
//   numList2
//     ?..length
//     ..first;
// }

// void name([bool flag = true, String string = "123456"]) {
//   print("flag:$flag,string:${string}");
// }

// void main(List<String> args) {
//   name();
//   name(false, "654321");
// }

//对象
// abstract class Animal {
//   int lifeCount = 0;
//   bool needDrink = false;
//   bool _canRun = false;

//   Animal(this.lifeCount, bool canRun, [this.needDrink = true])
//       : _canRun = canRun;

//   Animal.initLifeCount([this.lifeCount = 1]);

//   void living() {
//     print("我还有${lifeCount}条命");
//   }

//   void haveFoot();
// }

// class Dog implements Animal {
//   @override
//   late int lifeCount;

//   @override
//   late bool needDrink;

//   @override
//   bool _canRun;

//   Dog(int lifeCount, bool needDrink, [bool canRun = true])
//       : lifeCount = lifeCount,
//         needDrink = needDrink,
//         _canRun = canRun;

//   String _drink(bool need) {
//     if (need) {
//       return "喝口水${_canRun}";
//     } else {
//       return "别喝了${_canRun}";
//     }
//   }

//   @override
//   void haveFoot() {
//     print("我有四只脚");
//   }

//   @override
//   void living() {
//     print("拉倒吧，我还有${lifeCount}条命，${_drink(true)}");
//   }
// }

// class Person extends Animal {
//   Person(super.lifeCount, super.canRun);

//   @override
//   void haveFoot() {
//     print("我只有两只腿啦");
//   }
// }

// class Cat extends Animal {
//   String catName = "";

//   Cat(super.lifeCount, super.canRun, [String catName = ""]) : catName = catName;

//   static final Map<String, Cat> _cache = <String, Cat>{};
//   factory Cat.init(String catName) {
//     return _cache.putIfAbsent(catName, () => Cat(2, false));
//   }

//   @override
//   void haveFoot() {
//     print("我只有四只腿啦");
//   }

//   String get name => catName;
// }

// void main(List<String> args) {
//   Animal dog = Dog(1, true, false);
//   dog.haveFoot();
//   dog.living();
//   Cat.init("猫猫1").living();
// }

//枚举与混入
// enum ProgramType { Android, IOS, Harmony, PC, Flutter }

// //不是一个类，没有构造函数
// mixin MusicPlayer {
//   bool init = false;
//   bool playing = false;

//   // 切换播放状态
//   void togglePlayer() {
//     if (!init) {
//       print("音频播放器未初始化启动");
//       return;
//     }
//     playing = !playing;
//     print("${playing ? "音乐播放中" : "音乐已暂停"}");
//   }

//   // 初始化播放器
//   void playerInit() {
//     init = true;
//     print("音频播放器初始化");
//   }
// }

// /**
//  * 视频播放器
//  */
// mixin VideoPlayer {
//   bool init = false;
//   bool playing = false;

//   // 切换播放状态
//   void togglePlayer() {
//     if (!init) {
//       print("视频播放器未初始化启动");
//       return;
//     }
//     playing = !playing;
//     print("${playing ? "视频播放中" : "视频已暂停"}");
//   }

//   // 初始化播放器
//   void playerInit() {
//     init = true;
//     print("视频播放器初始化");
//   }
// }

// //当mixin的类中有重复的字段或者函数，调用时会使用写在后面的类的函数
// class PlayerProgram with VideoPlayer, MusicPlayer {}

// mixin Player on MusicPlayer {}

// //不能这么写，不知道为啥
// // class PlayerProgramOther with Player {}

// void main(List<String> args) {
//   PlayerProgram player = PlayerProgram();
//   player.playerInit();
//   player.togglePlayer();
// }

//异步

void main(List<String> args) {
  Future asyncFun() async {
    print("异步函数打印");
  }

  try {
    asyncFun();
  } catch (e) {
    print(e.toString());
  }
}
