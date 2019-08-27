class Stack
    attr_accessor :stack_array
    def initialize
      self.stack_array=[]
    end

    def push(el)
      # adds an element to the stack
      stack_array << el
    end

    def pop
      # removes one element from the stack
      stack_array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      stack_array[-1]
    end
  end

  stack = Stack.new
  stack.push('a')
  stack.push('b')
  p stack.peek # print b
  p stack.pop # print b
  p stack.peek    # print a