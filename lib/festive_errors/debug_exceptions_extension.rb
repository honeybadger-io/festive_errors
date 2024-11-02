module FestiveErrors
  module DebugExceptionsExtension
    private

    def create_template(*)
      template = super

      css_path = File.expand_path("../styles/christmas.css", __dir__)
      css_content = File.read(css_path)

      template.content_for :style do
        css_content.html_safe
      end

      template
    end
  end
end
