class PagesController < ApplicationController
  def home
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty fieldd!") and return
    else
      @parameter = params[:search].downcase
      @results = Animal.where("lower(title) LIKE :search", search: @parameter)
    end
  end
end
