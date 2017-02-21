class VentsController < ApplicationController
  def index
    vents = Vent.all
    render locals: {
      vents: vents,
      vent: Vent.new
    }
  end

  def create
    @vent = Vent.new(vent_params)
    respond_to do |format|
      if @vent.save
        if request.xhr?
          format.json {render json: @vent}
        else
          format.html { redirect_to :root, notice: 'Vent was successfully created.' }
        end
      else
        format.json { render json: @vent.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def vent_params
    params.require(:vent).permit(:text)
  end
end
