require_relative '../src/run01'
require 'rspec/expectations'
require 'test/unit'


class TestDiamond < Test::Unit::TestCase

  def test_01_fills_first_and_last_slot_in_tray
    p __method__

    fill_tray( [nil], 0).should == [0]
    fill_tray( [nil, nil], 1).should == [1,1]
    fill_tray( Array.new(3), 2).should == [2, nil, 2]
    r = 3; fill_tray( Array.new(r+1),r).should == [3, nil, nil, 3]
  end




end
