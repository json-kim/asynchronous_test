Future<void> main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}

// 정수(int)의 stream을 리턴하는 함수
// async*, yield 를 사용하는 것으로 보임
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

// 정수의 스트림을 인자값으로 받아 정수값들의 스트림에 대해 비동기 반복처리 수행
// await for 를 사용해서 일반적으로 iterable을 for loop 반복처리하듯 스트림을 반복처리
// await for 는 async 키워드를 표시해줘야 사용 가능
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}
