# require 'rubygems'
# require 'sinatra'
# require 'slim'
# require 'sinatra/reloader' if development?

class ContactController < ApplicationController


    register Sinatra::Flash

  get '/list' do
    contacts = DB[:contact].all.map { |contact| Contact.new(contact) }
    print contacts
    flash[:notice] = 'No hay contactos cargados en el sistema. Si lo desea puede comenzar a cargarlos' if contacts.empty?

    slim :'contact/list', :locals => {:contacts => contacts}
  end

  get '/new' do

    slim :'contact/new'
  end

  post '/new' do
    contact = Contact.new(params[:contact])
    full_name = contact.full_name
    email = contact.email
    phone_number = contact.phone_number
    address = contact.address

    DB[:contact].insert(:full_name => full_name, :email => email, :address => address, :phone_number => phone_number)

    redirect to('/list')
  end

  get '/show/:id' do
    contact = Contact.new DB[:contact].where(:id=>params[:id]).first

    slim :'contact/show', :locals => {:contact => contact}
  end

  delete '/delete/:id' do
    contact = Contact.new DB[:contact].where(:id=>params[:id]).first
    DB[:contact].where(:id=>params[:id]).delete
    flash[:notice] = "Se ha eliminado el contacto #{contact.full_name}"

    redirect to('/list')
  end

  get '/edit/:id' do |id|
    contact = Contact.new DB[:contact].where(:id=>params[:id]).first
    slim :'contact/edit', :locals => {:contact => contact}
  end

  put '/update/:id' do
    DB[:contact].where(:id=>params[:id]).update(params[:contact])

    redirect to("/show/#{params[:id]}")
  end

end