module FestiveErrors
  module DebugExceptionsExtension
    private

    def create_template(*)
      template = super

      template.content_for :style do
        <<~CSS.html_safe
          header h1::after {
            content: " 🎅";
          }
        CSS
      end

      template
    end
  end
end
