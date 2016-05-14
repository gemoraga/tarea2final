class ApiController < ApplicationController
protect_from_forgery except: :index
require 'json'
require 'rest-client'
  def buscar
    status = 200
    tag = params.require(:tag)
    access_token = params.require(:access_token)
    respuesta = RestClient.get 'https://api.instagram.com/v1/tags/' + tag.to_s + '?access_token=' + access_token.to_s, :content_type => 'application/json'
    respuestaParseada = JSON.parse respuesta
    datos = respuestaParseada["data"]
    cantidadPosts = datos["media_count"]
    puts datos
    puts cantidadPosts
    render :status => status, json: {
      metadata: {total: cantidadPosts},
      posts: 'chao',
      version: '1.1.1'
    }
  end
end
