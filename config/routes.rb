Rails.application.routes.draw do
  root 'welcome#teste'
  get 'teste', to: 'welcome#teste'
end
