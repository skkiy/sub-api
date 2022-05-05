Rails.application.routes.draw do
  scope '/api' do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations',
      sessions: 'auth/sessions',
    }
    resources :users, only: [:index, :show, :update]

    resources :subscriptions, only: [:index, :show, :create, :update, :destroy]
  end
end
