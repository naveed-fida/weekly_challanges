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
    sorted_by_grade = @students.sort_by {|grd, names| grd}
    sorted_by_grade.each { |grd, names| names.sort! }.each {|grd, name| sorted[grd] = name}
    sorted
  end

  def grade(grade)
    return [] if !@students[grade]
    @students[grade]
  end
end