class WantsController < ApplicationController
  
  def index
    @wants = Want.find(:all, :limit=>100)
  end
  
  def update
    
  end
  
end
