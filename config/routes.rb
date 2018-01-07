# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shorten_links, only: [:new, :create, :show]

  root to: "shorten_links#new"
end
