import 'package:alg_class/ring_buffer.dart';

void main() {
  final ringBuffer = RingBuffer<int>(8);
  ringBuffer.write(0);
  ringBuffer.write(1);
  ringBuffer.write(2);
  ringBuffer.write(3);
  ringBuffer.write(4);
  ringBuffer.write(5);
  ringBuffer.write(6);
  ringBuffer.write(7);
  ringBuffer.write(8);
  ringBuffer.write(9);
  ringBuffer.write(10);
  print(ringBuffer);
}
