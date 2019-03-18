Rails.application.routes.draw do
  root "events#index"
  get "eventsa" => "events#all", as: "all_events"
  get "eventsp" => "events#previous", as: "previous_events"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"
  # put "events/:id" => "events#update"
  
  resources :events
end
