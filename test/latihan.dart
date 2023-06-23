Future<void> printOrderMessage() async {
  var order = await fetchUserOrder();
  print('Your order is: $order'); // 4
  await Future.delayed(Duration(seconds: 1)); // Delay selama 1 detik
  print('Hello Polindra'); // 5
}

Future<String> fetchUserOrder() {
  return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
}

Future<String> haloIrfan() {
  return Future.delayed(const Duration(seconds: 2), () => 'Hello Irfan!');
}

void main() async {
  print('Kelas A'); // 1
  print('Awaiting user order...'); // 2
  countSeconds(4);
  print(await haloIrfan());
  await printOrderMessage();
}

void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i)); // 3
  }
}
