require 'lib/rect'

describe Rect do
  
  it "detects line intersection using Liang-Barsky" do
    
    # trivial rect
    rect = Rect.new(50, 50, 25, 25)
    rect.intersects_line?(25, 25, 85, 85).should == true
    rect.intersects_line?(95, 95, 150, 175).should == false
    rect.intersects_line?(25, 25, 60, 60).should == true
    
    # non-trivial clipping
    rect = Rect.new(75, 80, 150, 90)
    rect.intersects_line?(50, 50, 80, 80).should == true
    rect.intersects_line?(76, 81, 90, 90).should == true
    rect.intersects_line?(90, 90, 250, 250).should == true
    
    rect.intersects_line?(200, 200, 250, 250).should == false
    rect.intersects_line?(300, 80, 300, 125).should == false
    
  end
  
end