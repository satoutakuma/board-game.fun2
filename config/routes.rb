Rails.application.routes.draw do
  namespace :public do
    get 'games/new'
    get 'games/create'
    get 'games/index'
    get 'games/show'
    get 'games/edit'
    get 'games/update'
    get 'games/destroy'
  end
  namespace :public do
    get 'game_reply/create'
    get 'game_reply/destroy'
  end
  namespace :public do
    get 'game_comments/create'
    get 'game_comments/destroy'
  end
  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'games/index'
    get 'games/show'
    get 'games/destroy'
  end
  namespace :admin do
    get 'game_reply/destroy'
  end
  namespace :admin do
    get 'game_comments/destroy'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
