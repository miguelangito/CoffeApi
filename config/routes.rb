Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  post "user/new", to: "user#create"
  post "report/new", to: "report#create"
  get "report", to: "report#index"
  patch "report/update/:id", to: "report#update" 
end
