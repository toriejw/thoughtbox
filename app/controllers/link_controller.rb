class LinkController < ApplicationController

  def index
    if !current_user
      redirect_to login_path
    end
    @link = Link.new
    @links = Link.all
  end

  def create
    link = Link.new(link_params)
    if link.save
      flash[:notice] = "Link was created."
    else
      flash[:errors] = "Invalid. Try again."
    end
    redirect_to root_path
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
