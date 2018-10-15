class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all.sort_by { |f| f.name }
    erb :'landmarks/index'
  end

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params['landmark'])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
