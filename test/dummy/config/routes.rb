Rails.application.routes.draw do
  mount FestiveErrors::Engine => "/festive_errors"
  root to: "home#index"
end
