Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/answer', to: 'responses#answer'

  post '/event', to: 'responses#event'

  post '/dtmf', to: 'responses#dtmf'

  post '/caller_input', to: 'responses#caller_input'

  post '/event', to: 'responses#event'
end
