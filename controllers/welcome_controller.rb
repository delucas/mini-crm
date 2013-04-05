require_relative "application"

class WelcomeController < ApplicationController
  get "/" do
    slim :index
  end
end
