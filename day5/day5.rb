inp = IO.readlines("day5.in", chomp: true)

def find_biggest(inp)
    biggy = -1
    for line in inp do
        vals = line.split('->')
        for tmp in vals[0].split(',') do
            biggy = [biggy, tmp.to_i].max
        end
        for tmp in vals[1].split(',') do
            biggy = [biggy, tmp.to_i].max
        end
    end
    biggy
end

def make_grid(biggy)
    g = []
    for i in 0..biggy do
        g << Array.new(biggy + 1, '.')
    end
    g
end

def draw_line(grid, x1, y1, x2, y2)
    # only hor/vert
    if x1 == x2
        # vertical
        smallest = y1 < y2 ? y1 : y2
        largest = y1 < y2 ? y2 : y1
        while smallest <= largest do 
            grid[smallest][x1] = grid[smallest][x1] == '.' ? 1 : grid[smallest][x1] + 1
            smallest += 1
        end
    elsif y1 == y2
        # horizontal
        smallest = x1 < x2 ? x1 : x2
        largest = x1 < x2 ? x2 : x1

        while smallest <= largest do 
            grid[y1][smallest] = grid[y1][smallest] == '.' ? 1 : grid[y1][smallest] + 1
            smallest += 1
        end
    else
        # part 2, disable below to end of func if only want part 1
        #diagonal, only 45 degree
        #get left and right point
        smallerX = x1 < x2 ? x1 : x2
        smallerY = x1 < x2 ? y1 : y2
        biggerX = x1 < x2 ? x2 : x1
        biggerY = x1 < x2 ? y2 : y1
        #determine slope
        slope = smallerY < biggerY ? -1 : 1
        #draw line
        while smallerX <= biggerX do
            grid[smallerY][smallerX] = grid[smallerY][smallerX] == '.' ? 1 : grid[smallerY][smallerX] + 1
            smallerX += 1
            smallerY -= slope
        end
    end

end

def draw_lines(inp, grid)
    for line in inp do
        vals = line.split('->')
        left = vals[0].split(',')
        right = vals[1].split(',')
        draw_line(grid, left[0].to_i, left[1].to_i, right[0].to_i, right[1].to_i)
    end
end

def count_overlaps(grid)
    sum = 0
    for row in 0..grid.length-1 do
        for col in 0..grid[row].length-1 do
            sum += 1 if grid[row][col] != '.' && grid[row][col] > 1
        end
    end
    sum
end

# init empty grid
biggy = find_biggest inp
grid = make_grid biggy

# fill in each grid
draw_lines(inp, grid)

puts "count of overlaps: #{count_overlaps(grid)}"
