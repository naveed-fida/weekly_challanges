require 'pry'
class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    @students[grade] ||= []
    @students[grade] << name
  end

  def to_h
    sorted = {}
    @students.values.each {|students| students.sort!}
    @students.sort.each {|grd, name| sorted[grd] = name}
    sorted
  end

  def grade(grade)
    return [] if !@students[grade]
    @students[grade]
  end
end

