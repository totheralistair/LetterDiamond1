# going to have 2z+1 lines, each line has a bumper, a tray and another bumper.
# let's start with trays.
# and now start creating and gluing bumpers
# and now start creating the diamond ... for digits
# penultimate is converting digits to characters
# finally, growing toward char in to chars out

  def letter_diamond  letter
    x = index_of_letter  letter
    d = digit_diamond  x
    c = to_chars  d
  end

  def index_of_letter a
    chars_list = ('A'..'Z').to_a
    n = chars_list.index  a
  end

  def to_chars d
    d.each_index { |r|
      d[r].each_index { |c|
        d[r][c] = printable_char d[r][c]
      }
    }
    return d
  end

  def printable_char value
    case
      when !value
        spacer
      when value.is_a?( Integer )
        letter_from_digit value
      else
        value
    end
  end

def spacer
  '_'
end


def letter_from_digit value
  out_chars = ('A'..'Z').to_a
  return out_chars[ value ]
end


def digit_diamond  x
  d = diamond_holder  x
  for r in 0..x
    fill_those_rows_in_the_diamond  d, x, r
  end
  return d
end

def fill_those_rows_in_the_diamond d, x, r
  d[ r ] = d[ 2*x-r ] = row_in_diamond  x, r
  return d
end


def diamond_holder x
  Array.new  2*x+1
end

def row_in_diamond x, r
  bumper = bumper  x, r
  tray = tray_for_row r
  return bumper + tray + bumper
end

def bumper x, r
  Array.new(x-r)
end

def tray_for_row row
  tray = Array.new  1+2*row
  fill_tray  tray, row
end


def fill_tray tray, r # put r into first & last position
  tray[0], tray[tray.size-1] = r, r
  return tray
end


