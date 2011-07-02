Rails.application.routes.draw do
  match '/topics/:id/payment_require' => 'topics#payment_require?', :as => :topic_payment_require
  match '/contact-us' => 'contacts#new', :as => :contact
  
  resources :contacts, :controller => 'contacts'
  
  namespace :admin do
    resources :contacts
    resources :topics
  end
end
