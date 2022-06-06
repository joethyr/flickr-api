class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    @flickr = Flickr.new(Figaro.env.flickr_key, Figaro.env.flickr_secret)
    if params[:user_id].present?
      @photos = @flickr.photos.search(user_id: params[:user_id])
    else
      @photos = @flickr.photos.getRecent
    end
  end
end
