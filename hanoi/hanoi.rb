class Move
    attr_accessor :start_peg, :end_peg
    def initialize(start_peg, end_peg)
        @start_peg = start_peg
        @end_peg = end_peg
    end
    def opposite_of(move)
        move && @start_peg == move.end_peg && @end_peg == move.start_peg
    end
    def to_s
        "[#{@start_peg + 1}, #{@end_peg+1}]"
    end
end

class Peg
    attr_accessor :discs
    def initialize()
        @discs = []
    end
    def add_disc(weight)
        @discs.push(weight)
    end
    def isLegalPeg()
        @discs.each_cons(2).all?{|a,b| a >= b}
    end
end


class Board
    attr_accessor :previousBoard, :previousMove, :pegs
    def initialize(num_pegs)
        @previousBoard = nil
        @previousMove = nil
        @pegs = []
        for i in 0..num_pegs
            pegs[i] = Peg.new
        end
    end
    def copy
        board = Board.new(0)
        board.previousBoard = self
        board.pegs = Array.new(@pegs.length())
        @pegs.each_with_index {|peg, i|
            newPeg = Peg.new()
            newPeg.discs = Array.new(peg.discs)
            board.pegs[i] = newPeg
        }
        return board
    end
    def eql?(board)
        for i in 0..@pegs.length - 1
            my_peg = @pegs[i]
            his_peg = board.pegs[i]
            return false if !(my_peg.discs.eql? his_peg.discs)
        end
        return true
    end
    def isLegalBoard()
        for peg in @pegs
            return false if !peg.isLegalPeg()
        end
        return true
    end
    def possibleMoves()
        moves = []
        for start_peg in @pegs
            for end_peg in @pegs
                if start_peg != end_peg && !start_peg.discs.empty?
                    move = Move.new(pegs.index(start_peg), pegs.index(end_peg))
                    moves << move unless move.opposite_of(@previousMove)
                end
            end
        end
        return moves
    end
    def makeMove(move)
        start_peg_index = move.start_peg
        start_peg = @pegs[start_peg_index]
        end_peg_index = move.end_peg
        end_peg = @pegs[end_peg_index]
        disc = start_peg.discs.pop
        end_peg.discs.push(disc)
        @previousMove = move
    end
    def nextBoards()
        boards = []
        for move in possibleMoves()
            newBoard = copy()
            newBoard.makeMove(move)
            if newBoard.isLegalBoard()
                boards.push(newBoard)
            end
        end
        return boards
    end
    def movesList()
        moves = [@previousMove]
        prev = @previousBoard
        while prev
            moves.push prev.previousMove
            prev = prev.previousBoard
        end
        moves.compact.reverse
    end
end

def generate_board(input, n, k)
    board = Board.new(k)
    input.each_with_index do |peg_index, disc_weight|
        peg = board.pegs[peg_index-1]
        peg.add_disc(disc_weight + 1)
    end
    board.pegs.each do |peg|
        peg.discs = peg.discs.reverse
    end
    return board
end

line1 = gets.chomp.split.map {|s| s.to_i}
N = line1[0]
K = line1[1]
line2 = gets.chomp.split.map {|s| s.to_i}
line3 = gets.chomp.split.map {|s| s.to_i}

starting_board = generate_board(line2, N, K)
ending_board = generate_board(line3, N, K)

boardStates = Array.new(8, [])
boardStates[0] = [starting_board]

success_board = nil
for depth in (1..8)
    break if success_board
    # puts "depth: #{depth}"
    previousBoards = boardStates[depth-1]
    newBoards = []
    previousBoards.each {|board|
        nextBoards = board.nextBoards()
        newBoards += nextBoards
    }
    for newBoard in newBoards
        if ending_board.eql? newBoard
            success_board = newBoard
            break
        end
    end
    boardStates[depth] = newBoards
end

puts success_board.movesList.inspect
