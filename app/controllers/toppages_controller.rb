class ToppagesController < ApplicationController
  def index
    @workposts = Workpost.all
  end
end
