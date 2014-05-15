require 'sidekiq/web'

AddressBook::Application.routes.draw do
  root 'contacts#index'

  devise_for :users
  resources :contacts
  get '/contacts/:id/email', to: 'contacts#new_email', as: 'email_contacts'
  post '/contacts/:id/email', to: 'contacts#send_email'
  get '/contacts/:id/sent', to: 'contacts#sent_email', as: 'email_sent'

  mount Sidekiq::Web, at: '/sidekiq'
end


# contact GET    /contacts/:id(.:format)        contacts#show
#         PATCH  /contacts/:id(.:format)        contacts#update
#         PUT    /contacts/:id(.:format)        contacts#update
#         DELETE /contacts/:id(.:format)        contacts#destroy
# email_contacts GET    /contacts/:id/email(.:format)  contacts#new_email
#                POST   /contacts/:id/email(.:format)  contacts#send_email
#     email_sent GET    /contacts/:id/sent(.:format)   contacts#sent_email
#    sidekiq_web        /sidekiq                       Sidekiq::Web
