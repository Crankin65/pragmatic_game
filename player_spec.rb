require_relative 'player'
#require_relative 'spec_helper'

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
    $stdout = StringIO.new
  end

  it "has a capitalize name rspec3" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(150)
  end
     
  it "has a string representation" do
    expect(@player.name.class).to eq(String)
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(@player.health + @player.name.length)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t

    expect(@player.health).to eq(165)
  end

  it "decreases health by 10 when blammed" do
    @player.blam

    expect(@player.health).to eq(140)
  end
  
  context "with a health greater than 100" do
    before do
      @player = Player.new("larry", 150)
    end

    it "is strong" do
      expect(@player.strong?).to eq(true)
    end
  end

  context "with a health of 100 or less" do
    before do
      @player = Player.new("larry",90)
    end

    it "is wimpy (not strong)" do
      expect(@player.strong?).to eq(false)
    end
  end

end