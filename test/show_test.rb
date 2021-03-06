require 'minitest/autorun'
require './lib/character'
require './lib/show'
require 'pry'

class ShowTest < Minitest::Test
  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_intial_values
    assert_equal "Knight Rider", @knight_rider.name
    assert_equal "Glen Larson", @knight_rider.creator
    assert_equal [@michael_knight, @kitt], @knight_rider.characters
  end

  def test_show_total_salary
    assert_equal 2_600_000, @knight_rider.total_salary
  end

  def test_highest_paid_actor
    assert_equal "David Hasselhoff", @knight_rider.highest_paid_actor
  end

  def test_actor_name_access
    assert_equal ["David Hasselhoff", "William Daniels"], @knight_rider.actors
  end
end
