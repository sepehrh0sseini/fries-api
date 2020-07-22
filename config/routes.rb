Rails.application.routes.draw do
  devise_for :users

  scope :api do
    resources :cart_items, :orders, :categories, :products

	  get '/attachments/:id.:filename.:extension(/:size)',
      to: 'attachments#show',
      constraints: {
        id: /[0-9]*/,
        filename: /.*(?=\.[\w\d]+$)/
	    }
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
