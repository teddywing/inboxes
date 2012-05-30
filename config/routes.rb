Rails.application.routes.draw do

  scope :module => :inboxes do
    match '/discussions/settings' => 'discussions#settings'
    resources :inboxes_settings, :only => [:update]
  end
  
  resources :discussions, :except => :edit, :module => :inboxes do
    resources :messages, :only => [:create, :index]
    resources :speakers, :only => [:create, :destroy]
    member do
      post 'leave'
    end
  end

end