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

school = School.new

[
  ['Jennifer', 4], ['Kareem', 6],
  ['Christopher', 4], ['Kyle', 3]
].each do |name, grade|
  school.add(name, grade)
end

school.to_h
