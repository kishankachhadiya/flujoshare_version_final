class FlowchartsController < ApplicationController

  before_action :set_flowcharts

  def aceptado
    @flowcharts.update_attributes(status: 'aceptado', approved_by_id: current_user.id, approved_at: Time.now)
    redirect_to menu_procesos_flowchart_pendientes_path
  end
  
  def rechazado
    @flowcharts.update_attributes(status: 'rechazado', approved_by_id: current_user.id, approved_at: Time.now)
    redirect_to menu_procesos_flowchart_pendientes_path
  end

  private

  def set_flowcharts
    @flowcharts = FlowChart.find(params[:id])
  end

end
