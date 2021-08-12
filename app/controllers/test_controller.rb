class TestController < ApplicationController
  def index
    render json: Test.all
  end

  def create
    
  end
end
