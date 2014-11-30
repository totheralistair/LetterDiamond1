# going to have 2z+1 lines, each line has a bumper, a tray and another bumper.
# let's start with trays.
# and now start creating and gluing bumpers
# and now start creating the diamond ... for digits

# too much
#   def chars_for_digits d
#     out_char = [A..Z]
#     for row in d
#       for cell in row
#         value = d[row[cell]]
#         d[row[cell]] = out_char[ d[row[cell]] ]
#       end
#     end
#   end

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
  out_char = out_chars[ value ]
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
  row_contents = bumper + tray + bumper
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


