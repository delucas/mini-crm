require "sinatra/base"
require 'sinatra'
require 'sinatra/flash'
require "slim"
require "securerandom"
require 'sequel'

class ApplicationController < Sinatra::Base

  configure do
    set :root, File.join(File.dirname(__FILE__),'..')
    set :public_folder, File.join(File.dirname(__FILE__),'../static')
    enable :method_override, :sessions
    set :session_secret, SecureRandom.hex

    DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://root:root@localhost:5432/mini-crm')


    register Sinatra::Flash
  end
end
