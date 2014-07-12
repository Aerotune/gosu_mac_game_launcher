require 'rubygems'
require 'gosu'

$game_path = File.join(File.dirname(__FILE__), *%w[.. .. .. Game.app])

class Window < Gosu::Window
  def initialize
    super 400, 300, false

    self.caption = "Game Launcher!"
    @font = Gosu::Font.new(self, "Arial", 16)
    @message = "Game Launcher! Press Enter to start game!"
  end

  def draw
    
    x = self.width / 2 - @font.text_width(@message)/2.0
    y = self.height / 2 - 8
    @font.draw @message, x, y, 0
  end
  
  def button_down id
    case id
    when Gosu::KbReturn
      if system "open -a #{$game_path}"
        # successfully opened the game!
        close
      else
        @message = "Failed to open the game!"
      end
    end
  end

  def needs_cursor?
    true
  end
end

Window.new.show
