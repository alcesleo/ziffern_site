class ZiffernController < ApplicationController
  def index
    @german = GermanNumber.from_string(params[:number])
    render :flag
  end
end
