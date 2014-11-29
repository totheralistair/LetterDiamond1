require_relative '../src/run04'
require 'rspec/expectations'
require 'test/unit'


class TestDiamond < Test::Unit::TestCase

  def test_01_fills_first_and_last_slot_in_tray
    p __method__

    fill_tray( [nil], 0).should == [0]
    fill_tray( [nil, nil], 1).should == [1,1]
    fill_tray( Array.new(3), 2).should == [2, nil, 2]
    r = 3
    fill_tray( Array.new(r+1),r).should == [3, nil, nil, 3]
  end

  def test_02_makes_and_fills_tray_of_any_size
    p __method__

    make_and_fill_tray(0).should == [0]
    make_and_fill_tray(1).should == [1,nil, 1]
    make_and_fill_tray(2).should == [2, nil, nil, nil, 2]
    make_and_fill_tray(3).should == [3, nil, nil, nil, nil, nil, 3]
  end


  def test_03_makes_bumper_for_row_in_diamond
    p __method__

    make_bumper(2,0).should == [nil, nil]
    make_bumper(2,1).should == [nil]
    make_bumper(2,2).should == []
    make_bumper(0,0).should == []
  end


def test_04_glues_bumpers_to_tray_making_complete_row_in_diamond
    p __method__

    # start with a bumper and a tray, see they come out as a single thing
    make_row_in_diamond(0,0).should == [0]
    make_row_in_diamond(1,0).should == [nil, 0, nil]
    make_row_in_diamond(1,1).should == [1, nil, 1]
    make_row_in_diamond(2,0).should == [nil, nil, 0, nil, nil]
    make_row_in_diamond(2,1).should == [nil, 1, nil, 1, nil]
    make_row_in_diamond(2,2).should == [2, nil, nil, nil, 2]
  end




end
