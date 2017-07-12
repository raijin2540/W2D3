def my_uniq(arr)
  new_arr = []
  arr.each do |el|
    new_arr << el unless new_arr.include?(el)
  end

  new_arr
end


class Array
  def two_sum
    indices = []
    (0...self.length).each do |a|
      (a + 1...self.length).each do |b|
        indices << [a, b] if self[a] + self[b] == 0
      end
    end

    indices
  end
end

def my_transpose(arr)
  new_arr = Array.new(arr.size) { [] }
  (0...arr.length).each do |row|
    (0...arr[0].length).each do |col|
      new_arr[col] << arr[row][col]
    end
  end
  new_arr
end

def stock_picker(prices)
  highest_profit = 0
  highest_index = []
  idx1 = 0
  while idx1 < prices.length
    idx2 = idx1 + 1
    while idx2 < prices.length
      if prices[idx2] - prices[idx1] > highest_profit
        highest_profit = prices[idx2] - prices[idx1]
        highest_index = [idx1, idx2]
      end

      idx2 += 1
    end
    idx1 += 1
  end

  highest_index
end

class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def play
    until self.won?
      render
      move(prompt)
    end
  end

  def prompt
    input = []
    puts "choose a tower to move from"
    input << gets.chomp[0].to_i
    puts "choose a tower to move to"
    input << gets.chomp[0].to_i
    input
  end

  def move(move_arr)
    self.towers[move_arr[1]].push(self.towers[move_arr[0]].pop)
    self.towers
  end

  def won?
    self.towers == [[],[],[3, 2, 1]] || self.towers == [[],[3, 2, 1],[]]
  end

  def render
    self.towers.each_with_index { |tower, i| p "tower #{i}: #{tower}"}
  end

end

TowersOfHanoi.new.play
