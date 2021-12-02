inp = IO.readlines("day1.in", chomp: true)
count = 0

#part 1
ind = 1
while ind < inp.length() do
    count += 1 if inp[ind].to_i > inp[ind-1].to_i
    ind += 1
end

puts count

count = 0

#part 2
ind = 3
while ind < inp.length() do
    first_sum = inp[ind-1].to_i + inp[ind-2].to_i + inp[ind-3].to_i
    second_sum = inp[ind].to_i + inp[ind-1].to_i + inp[ind-2].to_i
    count += 1 if second_sum > first_sum
    ind += 1
end

puts count