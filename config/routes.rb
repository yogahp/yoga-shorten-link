# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shorten_links

  root to: "shorten_links#new"
end
