class HomeController < ApplicationController
  def index
    holiday = FestiveErrors.current_theme&.to_s&.capitalize || "Holidays"
    raise "Happy #{holiday}!"
  end
end
