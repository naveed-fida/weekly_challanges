class School
  def initialize
    @students = {}
  end

  def add(student, idx)
    @students[idx] ||= []
    @students[idx] << student
  end

  def to_h
    @students
  end
end