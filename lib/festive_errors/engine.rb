module FestiveErrors
  class Engine < ::Rails::Engine
    isolate_namespace FestiveErrors

    initializer "festive_errors.debug_exceptions" do |app|
      ActionDispatch::DebugExceptions.prepend FestiveErrors::DebugExceptionsExtension
    end
  end
end
