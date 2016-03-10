require 'pry'
class CircularBuffer
  class BufferEmptyException < RuntimeError
  end

  class BufferFullException < RuntimeError
  end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(item)
    return nil unless item
    raise BufferFullException if full?
    @buffer << item
  end

  def clear
    @buffer.clear
  end

  def write!(item)
    if full?
      return nil unless item
      read
    end
    write(item)
  end

  private

  def full?
    @buffer.size == @size
  end
end

buffer = CircularBuffer.new(2)
buffer.write(1)
buffer.write(2)
buffer.write! nil
