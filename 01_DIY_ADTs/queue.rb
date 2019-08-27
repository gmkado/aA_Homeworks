class Queue
    attr_accessor :queue_array

    def initialize
        self.queue_array = []
    end

    def enqueue(el)
        queue_array << el
    end

    def dequeue
        queue_array.shift
    end

    def peek
        queue_array[0]
    end
end

queue = Queue.new
queue.enqueue('a')
queue.enqueue('b')
p queue.peek # print a
p queue.dequeue # print a
p queue.peek    # print b