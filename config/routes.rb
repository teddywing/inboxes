Rails.application.routes.draw do

  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    resources :discussions, :except => :edit, :module => :inboxes do
      resources :messages, :only => [:create, :index]
      resources :speakers, :only => [:create, :destroy]
      member do
        post 'leave'
      end
    end
  end

end