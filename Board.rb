require './Tile.rb'
require './BoardUI.rb'
require 'byebug'

class Board
  attr_reader :size, :board

  def initialize(size=9)
    @size = size
    self.populate
    #self.bomb_populate
  end

  def generate
    @board = Array.new(@size) { Array.new(@size) }
  end

  def populate
    #debugger
    (self.generate).each do |row|
      row.each do |el|
        el = Tile.new
      end
    end
  end

  def bomb_rand
    @location = []
    while @location.uniq.length != 9
      @location << [rand(0...9), rand(0...9)]
    end
    @location
  end

  def bomb_populate
    bomb_rand.each do |el|
      x,y = el
      @board[x][y].bomb = true
    end
  end

  def render
    # * - unexplored squares
    # _ - interior
    # F = flag
    # B = bomb
    display = @board.dup
    display.each do |row|
      row.each do |square|
        if square.revealed?
          if square.bombed?
            square = BoardUI.bomb
          elsif square.neighbor_bomb_count == 0
            square = BoardUI.interior
          else
            square = neighbor_bomb_count
          end
        else
          if square.flagged?
            square = BoardUI.flag
          else
            square = BoardUI.unexplored
          end
        end
      end
    end
    return display
  end


end
