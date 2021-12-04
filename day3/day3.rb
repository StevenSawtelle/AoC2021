nums = IO.readlines("day3.in", chomp: true)

def make_most_and_least_common_from_nums(nums)
    one_count = Array.new(nums[0].length, 0)
    for num in nums do
        num.split('').each_with_index do |digit, i|
            one_count[i] += 1 if digit == '1'
        end
    end
    most_common = ''
    least_common = ''
    
    for i in 0..one_count.length-1 do
        if one_count[i] >= nums.length.to_f / 2
            most_common += '1'
            least_common += '0'
        else
            most_common += '0'
            least_common += '1'
        end
    end
    
    return [most_common, least_common]
end

# part 1
vals = make_most_and_least_common_from_nums(nums)
puts vals[0].to_i(2) * vals[1].to_i(2)

#part 2
old_nums = nums

o2 = nil
o2string = ''
o2ind = 0
most_common = vals[0]
while !o2 do
    o2string += most_common[o2ind]
    nums = nums.filter{ |num| num.start_with?(o2string)}
    o2 = nums[0] if nums.length == 1
    o2ind += 1
    new_vals = make_most_and_least_common_from_nums(nums)
    most_common = new_vals[0]
end


nums = old_nums
co2 = nil
co2string = ''
co2ind = 0
least_common = vals[1]
while !co2 do
    co2string += least_common[co2ind]
    nums = nums.filter{ |num| num.start_with?(co2string)}
    co2 = nums[0] if nums.length == 1
    co2ind += 1
    new_vals = make_most_and_least_common_from_nums(nums)
    least_common = new_vals[1]
end

puts o2.to_i(2) * co2.to_i(2)
