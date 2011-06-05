class Rect
  attr_reader :x, :y, :width, :height, :bottom, :right
  
  def initialize(x, y, width = 1, height = 1)
    @x, @y, @width, @height = x, y, width, height
    @bottom, @right = @y + height, @x + width
  end
  
  def intersects_line?(x1, y1, x2, y2)
    t0 = 0.0
    t1 = 1.0
    p = q = r = 0.0
    
    x_delta = x2 - x1
    y_delta = y2 - y1
    
    (0..3).each do |edge|
      
      if edge == 0 # left edge
        p = -x_delta
        q = -(@x - x1)
      end
      
      if edge == 1 # right edge
        p = x_delta
        q = (@right - x1)
      end
      
      if edge == 2 # top edge
        p = -(y_delta)
        q = -(@y - y1)
      end
      
      if edge == 3 # bottom edge
        p = y_delta
        q = (@bottom-y1)
      end

      r = q.to_f / p.to_f

      return false if p == 0 && q < 0 
      
      if p < 0
        if r > t1
          return false
        elsif r > t0
          t0 = r
        end
      elsif p > 0
        if r < t0
          return false
        elsif r < t1
          t1 = r
        end
      end
    end
    
    true
  end
  
end