module FestiveErrors
  THEMES = {
    christmas: "christmas.css",
    halloween: "halloween.css",
    valentines: "valentines.css",
    thanksgiving: "thanksgiving.css",
    newyears: "newyears.css"
  }.freeze

  def self.holiday_ranges(year)
    {
      christmas: Date.new(year, 12, 1)..Date.new(year, 12, 30),
      halloween: Date.new(year, 10, 1)..Date.new(year, 10, 31),
      valentines: (Date.new(year, 2, 14) - 7)..Date.new(year, 2, 14),
      thanksgiving: Date.new(year, 11, 1)..Date.new(year, 11, 30),
      newyears: Date.new(year, 12, 31)..Date.new(year + 1, 1, 1)
    }
  end

  def self.current_theme
    today = Date.today
    year = today.year

    # Get holiday ranges for current year
    ranges = FestiveErrors.holiday_ranges(year)

    # Check if today falls within a holiday range
    ranges.each do |theme, date_range|
      if date_range.cover?(today)
        return theme
      end
    end

    # Also check ranges from previous year (for dates that span multiple years)
    if today.month == 1
      prev_ranges = FestiveErrors.holiday_ranges(year - 1)
      prev_ranges.each do |theme, date_range|
        if date_range.cover?(today)
          return theme
        end
      end
    end

    nil # No theme if not within a holiday range
  end

  module DebugExceptionsExtension
    private

    def create_template(*)
      template = super

      return template unless (theme_file = THEMES[FestiveErrors.current_theme])

      css_path = File.expand_path("../styles/#{theme_file}", __dir__)
      css_content = File.read(css_path)

      template.content_for :style do
        css_content.html_safe
      end

      template
    end
  end
end
