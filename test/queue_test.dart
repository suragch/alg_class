import 'package:alg_class/queue.dart';
import 'package:test/test.dart';

void main() {
  group('LinkedList Queue', () {
    test('isEmpty works', () {
      final queue = QueueLinkedList<int>();
      expect(queue.isEmpty, true);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
    });

    test('enqueue works', () {
      final queue = QueueLinkedList<int>();
      queue.enqueue(1);
      expect(queue.toString(), '1');
      queue.enqueue(2);
      expect(queue.toString(), '1 -> 2');
    });
  });

  group('List Queue:', () {
    test('isEmpty works', () {
      final myQueue = QueueList<int>();
      expect(myQueue.isEmpty, true);
      myQueue.enqueue(1);
      expect(myQueue.isEmpty, false);
    });

    test('enqueue works', () {
      final myQueue = QueueList<int>();
      myQueue.enqueue(1);
      expect(myQueue.toString(), '[1]');
      myQueue.enqueue(2);
      expect(myQueue.toString(), '[1, 2]');
    });

    test('dequeue works', () {
      final myQueue = QueueList<int>();
      myQueue.enqueue(1);
      myQueue.dequeue();
      expect(myQueue.toString(), '[]');
      myQueue.enqueue(1);
      myQueue.enqueue(2);
      var value = myQueue.dequeue();
      expect(value, 1);
      expect(myQueue.toString(), '[2]');

      value = myQueue.dequeue();
      expect(value, 2);
      expect(myQueue.toString(), '[]');

      value = myQueue.dequeue();
      expect(value, null);
      expect(myQueue.toString(), '[]');
    });
  });
}
