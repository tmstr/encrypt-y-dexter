Rails.application.routes.draw do
  root 'home#index'

  controller :encrypted_messages do
    post '/encrypted_messages/create', action: 'create', as: 'create_encrypted_message'
    post '/encrypted_messages/lookup', action: 'lookup', as: 'lookup_encrypted_message'
    delete '/encrypted_messages/destroy', action: 'destroy', as: 'destroy_encrypted_message'
  end
end
