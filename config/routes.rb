Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :dubbing_projects
    resources :voiceover_projects
    resources :dubbings
    resources :voiceovers
    # your routes go here
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
