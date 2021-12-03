moves = IO.readlines("day2.in", chomp: true)

# part 1
# x = 0
# y = 0

# for move in moves do
#     move_split = move.split(' ')
#     case move_split.first
#     when 'forward'
#         x += move_split.last.to_i
#     when 'down'
#         y += move_split.last.to_i
#     when 'up'
#         y -= move_split.last.to_i
#     end
# end 

# puts x * y

# part 2
aim = 0
x = 0
depth = 0

for move in moves do
    move_split = move.split(' ')
    case move_split.first
        when 'forward'
            move_val = move_split.last.to_i
            x += move_val
            depth += move_val * aim
        when 'down'
            aim += move_split.last.to_i
        when 'up'
            aim -= move_split.last.to_i
    end
end 

puts x * depth
