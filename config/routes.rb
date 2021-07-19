Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kingdom_builder do
    resources :payment
  end

  resources :user
  resources :zone do
    resources :area do
      resources :parish
    end
  end
  get "/kingdom_builders/count" => "kingdom_builder#builders_count"
  get "/kingdom_builders/payment_breakdown/count" => "kingdom_builder#payment_breakdown_count"
  get "/kingdom_builders/zonal_pledgers/count" => "kingdom_builder#zonal_pledgers_count"
  post 'login', to: 'authentication#authenticate'
  get 'logout', to: 'authentication#destroy'
  get 'kingdom_builders', to: 'kingdom_builder#search'
  get 'kingdom_builder_payment/amount_paid/total', to: 'kingdom_builder#sum_user_payments'
end
