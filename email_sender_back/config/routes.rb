EmailSender::Application.routes.draw do
  root 'email#about'

  post '/email', to: 'email#email'
end
