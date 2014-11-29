require_relative '../src/run12'
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

    # start with a bumper and a tray, see they come out as a single thing
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

  def test_07_digit_diamond_fills_correctly
    p __method__

    digit_diamond(0).should ==
        [
            [0]
        ]

    digit_diamond(1).should ==
        [
            [nil, 0, nil],
            [1, nil, 1],
            [nil, 0, nil]
        ]

    digit_diamond(2).should ==
        [
            [nil, nil, 0, nil, nil],
            [nil, 1, nil, 1, nil],
            [2, nil, nil, nil, 2],
            [nil, 1, nil, 1, nil],
            [nil, nil, 0, nil, nil],
        ]
  end


  def test_08_can_get_char_from_digit
    p __method__

    letter_from_digit(0).should == 'A'
    letter_from_digit(1).should == 'B'
    letter_from_digit(25).should == 'Z'
  end

  def test_09_can_get_spacer_as_needed
    p __method__

    spacer_from_nil.should == '_'
  end

  def test_10_converts_value_to_printable
    p __method__

    printable_char(nil).should == '_'
    printable_char(0).should == 'A'
    printable_char(1).should == 'B'
    printable_char(25).should == 'Z'
    printable_char(';').should == ';'
  end

  def test_11_converts_digit_diamond_to_letters_diamond
    p __method__

    to_chars(digit_diamond(0)).should ==
        [
            ['A']
        ]

    to_chars(digit_diamond(1)).should ==
        [
            ['_', 'A', '_'],
            ['B', '_', 'B'],
            ['_', 'A', '_']
        ]
    to_chars(digit_diamond(2)).should ==
        [
            ['_', '_', 'A', '_', '_'],
            ['_', 'B', '_', 'B', '_'],
            ['C', '_', '_', '_', 'C'],
            ['_', 'B', '_', 'B', '_'],
            ['_', '_', 'A', '_', '_']
        ]
  end

  def test_12_can_get_digit_from_char
    p __method__

    index_of_letter('A').should == 0
    index_of_letter('C').should == 2
    index_of_letter('Z').should == 25
  end



end

