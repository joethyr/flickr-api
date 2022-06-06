class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    begin
      @flickr = Flickr.new(Figaro.env.flickr_key, Figaro.env.flickr_secret)
      return @photos = @flickr.photos.search(user_id: params[:user_id]) if params[:user_id].present?

      @photos = @flickr.photos.getRecent
    rescue StandardError => e
      flash[:alert] = "#{e.class}: #{e.message}."
      redirect_to root_path
    end
  end
end
