# going to have 2z+1 lines, each line has a bumper, a tray and another bumper.
# let's start with trays.
#


  def fill_tray tray, r # put r into first & last position
    tray[0], tray[tray.size-1] = r, r
    return tray
  end


