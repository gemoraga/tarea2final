class ApiController < ApplicationController
protect_from_forgery except: :index
require 'json'
  def buscar
    status = 200
    tag = params.require(:tag)
    access_token = params.require(:access_token)
    puts tag
    render :status => status, json: {
      metadata: 'hola',
      posts: 'chao'
    }
  end
end
