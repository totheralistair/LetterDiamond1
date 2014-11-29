# going to have 2z+1 lines, each line has a bumper, a tray and another bumper.
# let's start with trays.
# and now start creating and gluing bumpers
# and now start creating the diamond ... for digits

  # sketch of future code, but test the inner bit first
  # def make_digit_diamond  x
  #   d = create_diamond_holder  x
  #   for r in 0..x-1
  #     fill_the_r_rows_in_the_diamond  d, x, r
  #   end
  # end

  def fill_the_r_rows_in_the_diamond d, x, r
    # assumes r is in the top half of the diamond
    row_contents = row_in_diamond  x, r
    d[ r ] = row_contents
    d[ 2*x-r ] = row_contents
    return d
  end


  def diamond_holder x
    Array.new  2*x+1
  end

  def row_in_diamond x, r
    bumper = bumper  x, r
    tray = tray_for_row r
    answer = bumper + tray + bumper
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


