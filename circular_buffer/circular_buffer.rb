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
    return nil if item.nil?
    raise BufferFullException if full?
    @buffer << item
  end

  def clear
    @buffer.clear
  end

  def write!(item)
    if full?
      return nil if item.nil?
      read
    end
    write(item)
  end

  private

  def full?
    @buffer.size == @size
  end
end

