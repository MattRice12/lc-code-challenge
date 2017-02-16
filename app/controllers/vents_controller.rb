class VentsController < ApplicationController
  def index
    vents = Vent.all
    render locals: {
      vents: vents,
      vent: Vent.new
    }
  end

  def create
    vent = Vent.new(vent_params)
    if vent.save
      if request.xhr?
        render json: vent
      else
        redirect_to :root, notice: 'Vent successfully submitted.'
      end
    else
      render json: {status: "failure"}
    end
  end


  private

  def vent_params
    params.require(:vent).permit(:text)
  end
end
