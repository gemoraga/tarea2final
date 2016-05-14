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
    temp = RestClient.get 'https://api.instagram.com/v1/tags/' + tag.to_s + '/media/recent/', {:content_type => 'application/json', :params => {:count => 20, :access_token => access_token}}
    tempParseado = JSON.parse temp
    fotos = tempParseado["data"]
    #tags = datosFotos["tags"]
    #username = datosFotos["user"]["username"]
    #likes = datosFotos["likes"]["count"]
    #url = datosFotos["images"]["standard_resolution"]
    #caption = datosFotos["caption"]["text"]
    i = 0
    while i < fotos.length
      datosFotos = fotos[i]
      tags = datosFotos["tags"]
      username = datosFotos["user"]["username"]
      likes = datosFotos["likes"]["count"]
      url = datosFotos["images"]["standard_resolution"]["url"]
      caption = datosFotos["caption"]["text"]
      if i == 0 
        posts = '{tags: ' + tags.to_s + ', username: ' + username.to_s + ', likes: ' + likes.to_s + ', url: ' + url.to_s + ', caption: ' + caption.to_s + '}'
      else
        post = ', {tags: ' + tags.to_s + ', username: ' + username.to_s + ', likes: ' + likes.to_s + ', url: ' + url.to_s + ', caption: ' + caption.to_s + '}'
        posts += post
      end
    posts2 = '{' + posts + '}'
    i += 1
    end
    puts posts2
    render :status => status, json: {
      metadata: {total: cantidadPosts},
      posts: posts2,
      version: '1.2.0'
    }
  end
end
