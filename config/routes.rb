Rails.application.routes.draw do

  root to: "options#index"

  get "options" => "options#index"
  get "randomize" => "randomize#index"
  
end
