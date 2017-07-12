require 'first_tdd'
describe "#my_uniq" do

  it "should return a new Array with duplicates removed" do
    expect(my_uniq([0, 1, 2, 2, 3, 3])).to eq([0, 1, 2, 3])
    expect(my_uniq([1, 1, 2, 3])).to eq([1, 2, 3])
  end
end

describe "#two_sum" do
  it "should return an array of index pairs where those elements sum to zero" do
    expect([-2, -1, 0, 1, 2].two_sum).to eq([[0, 4], [1, 3]])
    expect([-1, 2, 0, 1, -2].two_sum).to eq([[0, 3], [1, 4]])
  end

  it "should return an empty array if no two elements sum to zero" do
    expect([0, 1, 2, 3, 4].two_sum).to eq([])
  end

end

describe "#my_transpose" do

  it "should transpose a square array" do
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7], [2, 5, 8]])
    expect(my_transpose([[1, 0], [2, 1]])).to eq([[1, 2], [0, 1]])
  end

end

describe "#stock_picker" do
  it "should return the most profitable pair of days (buy first, sell second)" do
    expect(stock_picker([5, 10, 3, 7, 11, 20, 4])).to eq([2, 5])
    expect(stock_picker([20, 21, 23, 19, 18, 20, 24])).to eq([4, 6])
  end
end

describe TowersOfHanoi do
  subject(:towers_game) { TowersOfHanoi.new }

  describe "#move" do
    it "should move the top disk from one pile another" do
      expect(towers_game.move(0, 2)).to eq([[3, 2], [], [1]])
      expect(towers_game.move(0, 1)).to eq([[3], [2], [1]])
    end

  end

  describe "#won?" do
    it "checks if the game is over" do

      towers_game.move(0, 2)
      towers_game.move(0, 1)
      towers_game.move(2, 1)
      towers_game.move(0, 2)
      expect(towers_game.won?).to eq(false)
      towers_game.move(1, 0)
      towers_game.move(1, 2)
      towers_game.move(0, 2)
      expect(towers_game.won?).to eq(true)
    end
  end


end
