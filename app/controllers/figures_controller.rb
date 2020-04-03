class FiguresController < ApplicationController

  get('/figure/new') do 
    @landmarks= Landmark.all 
    @titles = Title.all
    erb:'figures/new'
  end

  post('/figures') do
   
    @figure = Figure.create({
      name: params[:name],
      landmark_ids: params[:landmark],
      title_ids: params[:titles]
    })
    Landmark.create({
      name: params[:landmark_name]
    })
    Title.create({
      name: params[:title]
    })
    redirect "/figures/#{@figure.id}"
  end

  get('/figures') do
    @figures = Figure.all
    erb :"figures/index"
  end

  get('/figures/:id')  do
    @figure = Figure.find_by(id: params[:id])
    erb :"figures/show"

  end
  get('/figures/:id/edit') do
    @figure = Figure.find_by(id: params[:id])
    @landmarks = Landmark.all
    erb :"figures/edit"

  end

  patch('/figures') do
    @figure = Figure.find_by(id: params[:id])
    @figure.update({
      name: params[:name],
      landmark_ids: params[:landmark],
      title_ids: params[:titles]
    })
    redirect "/figures/#{@figure.id}"
  end

  get('/titles') do
    @titles = Title.all 
    erb :'figures/index'
  end
  

  
  

end
