require 'rubygems'
require 'gosu'

class Window < Gosu::Window
  def initialize
    super 800, 600, false

    self.caption = "Game Application!"
    @font = Gosu::Font.new(self, "Arial", 38)
  end

  def draw
    message = "Game Application!"
    x = self.width / 2 - @font.text_width(message) / 2
    y = self.height / 2 - 19
    
    rotate Math.sin(Time.now.to_f)*5, 400, 300 do
      @font.draw message, x, y, 0
    end
  end

  def needs_cursor?
    true
  end
end

Window.new.show
