class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only:[ :id, :name, :species ]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
    render json: {id: bird.id, name: bird.name, species: bird.species } 
    else
      render json: {message: "I'm sorry, this isn't the bird you're looking for."}
    end
  end

end