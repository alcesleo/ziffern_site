class ZiffernController < ApplicationController
  def index
    german = GermanNumber.from_string(params[:number])
    render :flag, locals: {
      input: german.number,
      output: german.text
    }
  end
end
