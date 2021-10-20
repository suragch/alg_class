import 'package:alg_class/ring_buffer.dart';
import 'package:test/test.dart';

void main() {
  test('filling up the ring buffer', () {
    final ringBuffer = RingBuffer<int>(4);
    expect(ringBuffer.isEmpty, true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.isFull, true);
  });

  test('overfull buffer', () {
    final ringBuffer = RingBuffer<int>(4);
    expect(ringBuffer.isEmpty, true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.write(0), true);
    expect(ringBuffer.isFull, true);

    expect(ringBuffer.write(0), false);
  });

  test('reading a value from the buffer', () {
    final ringBuffer = RingBuffer<int>(4);
    var value = ringBuffer.read();
    expect(value, null);

    ringBuffer.write(22);
    value = ringBuffer.read();
    expect(value, 22);

    ringBuffer.write(10);
    ringBuffer.write(11);
    ringBuffer.write(12);
    ringBuffer.write(13);

    value = ringBuffer.read();
    expect(value, 10);
    value = ringBuffer.read();
    expect(value, 11);
    value = ringBuffer.read();
    expect(value, 12);
    value = ringBuffer.read();
    expect(value, 13);

    value = ringBuffer.read();
    expect(value, null);
  });
}
