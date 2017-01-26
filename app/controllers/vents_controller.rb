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
      redirect_to :root
    else
      render "index.html.erb", locals: {
          vents: Vent.all,
          vent: vent
        }
    end
  end

  private

  def vent_params
    params.require(:vent).permit(:text)
  end
end
