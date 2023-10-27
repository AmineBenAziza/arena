# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment
  resources :weapons, controller: :equipment, only: [:create, :update, :show, :destroy]
  resources :shields, controller: :equipment, only: [:create, :update, :show, :destroy]
  resources :fighters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :fights, only: [:new, :create, :index, :show]
  root 'fights#new'
end
