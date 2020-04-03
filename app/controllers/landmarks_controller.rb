class LandmarksController < ApplicationController
  
  get('/landmarks/new') do 
    erb :'landmarks/new'
  end

  post('/landmarks') do
    @landmark = Landmark.create({
      name: params[:name],
      year_completed: params[:year_completed]
    })
    redirect :"/landmarks"
  end

  get('/landmarks') do
    @landmarks = Landmark.all 
    erb :'landmarks/index'
  end

  get('/landmark/:id') do 
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/show'
  end

  get('/landmark/:id/edit') do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/edit'
  end

end
