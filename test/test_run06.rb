require_relative '../src/run06'
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

    tray_for_row(0).should == [0]
    tray_for_row(1).should == [1,nil, 1]
    tray_for_row(2).should == [2, nil, nil, nil, 2]
    tray_for_row(3).should == [3, nil, nil, nil, nil, nil, 3]
  end


  def test_03_makes_bumper_for_row_in_diamond
    p __method__

    bumper(2,0).should == [nil, nil]
    bumper(2,1).should == [nil]
    bumper(2,2).should == []
    bumper(0,0).should == []
  end


def test_04_glues_bumpers_to_tray_making_complete_row_in_diamond
    p __method__

    row_in_diamond(0,0).should == [0]
    row_in_diamond(1,0).should == [nil, 0, nil]
    row_in_diamond(1,1).should == [1, nil, 1]
    row_in_diamond(2,0).should == [nil, nil, 0, nil, nil]
    row_in_diamond(2,1).should == [nil, 1, nil, 1, nil]
    row_in_diamond(2,2).should == [2, nil, nil, nil, 2]
  end

  def test_05_makes_diamond_the_right_size
    p __method__

    diamond_holder(0).should == Array.new(1)
    diamond_holder(1).should == Array.new(3)
    diamond_holder(2).should == Array.new(5)
  end

  def test_06_puts_a_row_in_both_upper_and_lower_half_of_diamond
    p __method__

    fill_the_r_rows_in_the_diamond( diamond_holder(0), 0, 0).should ==
        [
            [0]
        ]

    fill_the_r_rows_in_the_diamond( diamond_holder(1), 1, 0).should ==
        [
            [nil, 0, nil],
            nil,
            [nil, 0, nil]
        ]
    fill_the_r_rows_in_the_diamond( diamond_holder(1), 1, 1).should ==
        [
            nil,
            [1, nil, 1],
            nil
        ]

    fill_the_r_rows_in_the_diamond( diamond_holder(2), 2, 0).should ==
        [
            [nil, nil, 0, nil, nil],
            nil,
            nil,
            nil,
            [nil, nil, 0, nil, nil],
        ]
    fill_the_r_rows_in_the_diamond( diamond_holder(2), 2, 1).should ==
        [
            nil,
            [nil, 1, nil, 1, nil],
            nil,
            [nil, 1, nil, 1, nil],
            nil
        ]
    fill_the_r_rows_in_the_diamond( diamond_holder(2), 2, 2).should ==
        [
            nil,
            nil,
            [2, nil, nil, nil, 2],
            nil,
            nil
        ]
  end


end

