Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope 'api' do
    scope 'v2' do
      scope module: 'api' do
        scope module: 'v2' do
          get '/group_types', to: 'group_type#index'
          get '/input_types', to: 'input_type#index'
          get '/group_types/:kind', to: 'group_type#show'
          get '/input_types/:kind', to: 'input_type#show'
          get '/devices/:id', to: 'device#show'
          get '/nodes', to: 'node#index'
          post '/requests', to: 'request#create'
        end
      end
    end
  end
end
