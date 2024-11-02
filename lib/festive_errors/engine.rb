module FestiveErrors
  class Engine < ::Rails::Engine
    initializer "festive_errors.debug_exceptions" do |app|
      ActionDispatch::DebugExceptions.prepend FestiveErrors::DebugExceptionsExtension
    end
  end
end
