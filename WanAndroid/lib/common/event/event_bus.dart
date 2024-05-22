import 'dart:async';

/// Stream实现事件总线
/// 这段代码定义了一个名为EventBus的类，
/// 它的功能是使用Dart的[Stream] API向监听器分发事件。
/// 这个类使得应用程序可以解耦，允许对象在不显式定义监听器并跟踪它们的情况下交互。
/// 但是，并非所有事件都应该通过EventBus广播，只有那些具有普遍兴趣的事件才应该使用它。
/// 事件是正常的Dart对象，通过指定一个类，监听器可以过滤事件。
class EventBus {
  final StreamController _streamController;

  /// 事件流
  StreamController get streamController => _streamController;

  /// 这段代码是Dart语言中创建一个[EventBus]的函数。
  /// 该函数具有一个可选参数[sync]，用于决定事件是在[fire]调用时直接传递给流的监听器，还是在创建事件的代码完成后在稍后的时间传递给监听器。如果[sync]为true，则事件会立即传递给监听器；如果为false（默认值），则事件会在稍后传递给监听器。
  /// 该函数的作用是创建一个事件总线对象，用于在应用程序中发布和订阅事件
  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  /// 这段代码是dart语言中的一个函数构造器的注释文档。它描述了一个可以传入自定义控制器的函数构造器，
  /// 并举了一个使用RxDart Subject作为控制器的例子。
  /// 这个函数构造器允许用户在创建对象时使用自定义的控制器，
  /// 而不是默认的StreamController。
  EventBus.customController(StreamController controller)
      : _streamController = controller;

  ///这段代码定义了一个函数[on]<T>()，
  ///它用于监听类型为[T]及其子类型的事件。如果函数被调用时没有指定类型参数，
  ///则返回的[Stream]包含这个[EventBus]中的所有事件。
  ///返回的Stream是一个广播流，允许多个订阅。
  ///每个监听器独立处理，如果一个监听器暂停，只会影响该暂停的监听器。
  ///暂停的监听器会内部缓冲事件，直到取消或重新订阅。
  ///为了避免内存泄漏，通常最好取消订阅后再重新订阅。
  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T> ;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  /// 这个函数是在dart中用来在一个指定的事件总线上触发一个新的事件。 [event].
  ///
  void fire(event) {
    streamController.add(event);
  }

  ///这个函数是用于销毁[EventBus]的。通常只在测试环境中使用。
  void destroy() {
    _streamController.close();
  }
}
