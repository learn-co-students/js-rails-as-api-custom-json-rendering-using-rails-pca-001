class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:id, :name, :species]
    #reminder: No need for instance variables anymore, since we're immediately rendering birds and bird to JSON and are not going to be using ERB.
    #Visiting or fetching http://localhost:3000/birds will now produce our array of bird objects and each object will only have the id, name and species values, leaving out everything else
    else
      render json: { message: 'Bird not found' }
      # Now, if we were to send a request to an invalid endpoint like http://localhost:3000/birds/hello_birds, rather than receiving a general HTTP error, we would still receive a response from the API
    end
  end
end