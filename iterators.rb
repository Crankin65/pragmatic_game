def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end

#conversation { puts "Good to meet you!"}

def five_times
  i = 1
  while i < 6
    yield i
    i += 1
  end
end

five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end