Rails.application.routes.draw do
  root 'checker#show'
  post 'checker/check_name'
  get 'checker/show'
end
