Rails.application.routes.draw do

  root to: "options#index"

  get "options" => "options#index"
  post "randomize" => "randomize#index"
  
end
