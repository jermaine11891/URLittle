class UrlsController < ApplicationController
  def new
    @shortened_url = Url.new
  end

  def create
    @shortened_url = Url.new(url_params)
    if @shortened_url.save
      flash[:shortened_id] = @shortened_url.id
      redirect_to new_url_url
    else
      render :action => "new"
    end
  end

  def show
   id = params[:id]
   @shortened_url = Url.find id.to_i
   return redirect_to @shortened_url.url unless id[-1] == "+"
  end

  private
  def url_params
      params.require(:url).permit(:url)
    end
end
