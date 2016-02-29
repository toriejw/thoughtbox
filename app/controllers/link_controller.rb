class LinkController < ApplicationController

  def index
    if !current_user
      redirect_to login_path
    else
      @link = Link.new
      @links = current_user.links
    end
  end

  def create
    link = Link.new(link_params)
    if link.save
      current_user.links << link
      flash[:notice] = "Link was created."
    else
      flash[:errors] = "Invalid. Try again."
    end
    redirect_to root_path
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    Link.update(params[:id], link_params)
    redirect_to root_path
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
