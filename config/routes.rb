Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kingdom_builder do
    resources :payment
  end

  resources :user
  get "/kingdom_builders/count" => "kingdom_builder#builders_count"
  get "/kingdom_builders/payment_breakdown/count" => "kingdom_builder#payment_breakdown_count"
  get "/kingdom_builders/zonal_pledgers/count" => "kingdom_builder#zonal_pledgers_count"
end
