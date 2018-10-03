Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :boards, only: [:index, :show] do
    resources :lists, only: [:create, :update, :destroy] do
      resources :cards, only: [:create, :update, :destroy]
    end

    match 'sort_cards', to: 'lists#sort_cards', via: [:put]
  end

  root 'boards#index'
end
