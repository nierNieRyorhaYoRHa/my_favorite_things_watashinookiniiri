class ThingsController < ApplicationController
  def index
    @things = Thing.all
  end

  def new
  end
end
