Rails.application.routes.draw do
  
  
  resources :profiles, only: [:edit, :update]
  resources :comentarios
  resources :flowcharts, only: :index do
    get :accept, on: :member
    get :reject, on: :member
  end

  resources :procesos do
    get :view_proceso, on: :member
  end
  devise_for :users
  
  authenticated :user do
    root 'procesos#index'
  end

  unauthenticated :user do
    devise_scope :user do
      root 'devise/sessions#new'
    end
  end

  get 'menu/diagrama_flujo'
  get 'menu/comentarios'
  get 'menu/cambios_aprobados', to: 'menu#cambios_aprobados' 
  get 'menu/estadisticas'
  get 'menu/contribuidores'
  get 'menu/procesos_pendientes', to: 'menu#procesos_pendientes'
  get 'menu/procesos_flowchart_pendientes', to: 'menu#procesos_flowchart_pendientes'

  get 'cambio_estado_proceso/:valor/:id', to: 'menu#cambio_estado_proceso', as: 'cambio_estado_proceso'
  
  resources :posts do
  	resources :comments
  end

end
