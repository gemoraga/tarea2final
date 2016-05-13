class ApiController < ApplicationController
protect_from_forgery except: :index
require 'json'
require 'rest-client'
  def buscar
    status = 200
    tag = params.require(:tag)
    access_token = params.require(:access_token)
    puts tag
    respuesta = RestClient.get 'https://api.instagram.com/v1/tags/' + tag.to_s + '?access_token=' + access_token.to_s, :content_type => 'application/json'
    respuestaParseada = JSON.parse respuesta
    datos = respuesta["data"]
    cantidadPosts = datos["media_count"]
    render :status => status, json: {
      metadata: cantidadPosts,
      posts: 'chao'
      version: '1.1.0'
    }
  end
end
