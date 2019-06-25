# Part 1

def double_elem(array)
  # ADD YOUR CODE HERE
  if (array==[]||[nil])
    return []
  end
  array.map {|a| 2*a}
end
#puts double_elem([1,2,3,4])
#puts double_elem([])

def missing_num(array)
  # ADD YOUR CODE HERE
if array==[]||array==[nil]
  return 0
end
  sum=(array.length+1)*(array.length)/2
  other_array=array.reduce(:+)
  sum-other_array
end
#puts missing_num([])
#puts missing_num([0,2,3])

def check_product?(array, n)
  # ADD YOUR CODE HERE
  return false unless array.combination(3).any?{|group| group.inject(:*)==n}
  true
end
#puts check_product?([1,2,3],6)
# Part 2

def concatenate_words(w1, w2)
  # ADD YOUR CODE HERE
  w1+" "+w2
end
#puts concatenate_words('Hello','Kugou')
def valid_parentheses?(s)
  # ADD YOUR CODE HERE
  stack=[]
  reference={'('=>')','{'=>'}','['=>']'}
  left=reference.keys
  right=reference.values
  return false if s.length.odd?
  return true if s==""
  s.each_char do |char|
    if left.include? char
      stack<<char
    elsif right.include?char
      return false if stack.empty?|| (reference[stack.pop]!=char)
    end
  end
  return stack.empty?
end
#puts valid_parentheses?(['{)'])

def longest_common_prefix(s)
  # ADD YOUR CODE HERE
    s.length.times do |x|
      s.each{|a| if a.include?(s.min)
             else s.min.chop!
                 end}
    end
  return s.min

end
#puts longest_common_prefix(%w[a aa abc])
# Part 3

class Student
# ADD YOUR CODE HERE
  def initialize(name,arrival_time_at_classroom)
    @name=name
    @arrival_time_at_classroom=arrival_time_at_classroom
    if name==""||arrival_time_at_classroom==""
      raise ArgumentError.new("Incorrect format")
    end
	  unless arrival_time_at_classroom.match /^(0[0-9]|1[012])(:[0-5][0-9]) (am|pm)/
    raise ArgumentError.new("Incorrect Format")
	end
  end

  def arrive_on_time_for_class?
    return false unless @arrival_time_at_classroom.match /^((0[0-7])(:[0-5][0-9]) (am))|^(08:00 am)/
    true
  end
end
s1 = Student.new("Bob", "08:12 am")

s2 = Student.new("Den", "08:11 am")
s3 = Student.new("Ann", "07:12 am")
#s4 = Student.new("Alice", "088:12 am")
s5 = Student.new("Tom", "08:12 pm")
#s6 = Student.new("Jack", "13:11 am")
s7 = Student.new("Rose", "04:12 pm")
s8 = Student.new("A", "08:00 am")
s9 = Student.new("B", "07:59 am")
s10 = Student.new("C", "02:12 am")
#s11 = Student.new("D", "22:12 am")
#s12 = Student.new("E", "14:12 pm")
#s13 = Student.new(nil, "02:12 pm")
#s20 = Student.new('K', '02:12 PM')
puts s1.arrive_classroom_on_time?  == false ? correct+=1 : wrong+=1