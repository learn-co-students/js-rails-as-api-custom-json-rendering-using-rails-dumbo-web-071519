class BirdsController < ApplicationController


  
    def index
         birds = Bird.all
         render json: birds, only: [:id, :name, :species]
       end
  


  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

  #can also use slice,  def show
#   bird = Bird.find_by(id: params[:id])
#   render json: bird.slice(:id, :name, :species)
# end


# It won't work with an array of hashes?

# If this is the case, add the only: option like so

# def index
#   birds = Bird.all
#   render json: birds, only: [:id, :name, :species]
# end


#can also use except 

# def index
#   birds = Bird.all
#   render json: birds, except: [:created_at, :updated_at]
# end


end