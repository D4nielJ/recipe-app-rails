class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
end
