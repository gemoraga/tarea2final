class ApiController < ApplicationController
protect_from_forgery except: :index
  def buscar
    tag = params.require(:tag)
    access_token = params.require(:access_token)
    puts tag
    respond_to do |format|
        format.html { redirect_to buscar, notice: 'Player was successfully created.' }
        format.json { render metadata: 'hola', post: 'chao'}
    end
  end
end
