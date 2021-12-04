inp = IO.readlines("day4.in", chomp: true)

def check_win(board_hit)
    #rows
    # puts "rows"
    for row in board_hit do
        return true if row.all? { |el| el == "x"}
    end
    #cols
    # puts "cols"
    for col in 0..board_hit.length-1 do
        return true if board_hit.all? {|row| row[col] == "x"} 
    end
    #diagnols
    false
    # puts "diags"
    # res = true
    # row = 0
    # col = 0
    # while row < board_hit.length do
    #     if board_hit[row][col] != "x"
    #         res = false
    #         break
    #     end
    #     row += 1
    #     col += 1
    # end
    # return res if res
    # # puts "diags 2"
    # res = true
    # row = board_hit.length - 1
    # col = 0
    # while row >= 0 do
    #     # puts "#{row} #{col}"
    #     if board_hit[row][col] != "x"
    #         return false
    #     end
    #     row -= 1
    #     col += 1
    # end
    # true
end

def make_board(rows)
    board = []
    for row in rows do
        board << row.split(" ")
    end
    board
end

def make_hit_board
    [["","","","",""],
    ["","","","",""],
    ["","","","",""],
    ["","","","",""],
    ["","","","",""]]
end

def hit(board, board_hit, draw)
    for row in 0..board.length-1 do
        for col in 0..board[row].length-1 do
            if board[row][col] == draw
                board_hit[row][col] = 'x'
                # puts "hit"
                return check_win(board_hit)
            end
        end
    end
    false
end

def get_score(board, board_hit, draw)
    sum = 0
    for row in 0..board.length-1 do
        for col in 0..board[row].length-1 do
            sum += board[row][col].to_i if board_hit[row][col] != "x"
        end
    end
    return sum * draw.to_i
end

draws = inp[0].split(',')

boards = []
board_hits = []
i = 2
while i < inp.length do
    boards << make_board(inp[i..i+4])
    board_hits << make_hit_board
    i += 6
end

win_map = {}
win_count = 0

for draw in draws do
    for i in 0..boards.length-1 do
        win = hit(boards[i], board_hits[i], draw)
        if win && !win_map.key?(i)
            win_count += 1
            win_map[i] = true
            puts "first win #{get_score(boards[i], board_hits[i], draw)}" if win_count == 1
            puts "last win #{get_score(boards[i], board_hits[i], draw)}" if win_count == boards.length
        end
    end
end