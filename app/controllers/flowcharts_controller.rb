class FlowchartsController < ApplicationController

  before_action :set_flowcharts

  def accept
    @flowcharts.update_attributes(status: 'accepted', approved_by_id: current_user.id, approved_at: Time.now)
    flash[:success] = "flowchart accepted succefully."
    redirect_to menu_procesos_flowchart_pendientes_path
  end
  
  def rejected
    @flowcharts.update_attributes(status: 'rejected', approved_by_id: current_user.id, approved_at: Time.now)
    flash[:success] = "flowchart rejected succefully."
    redirect_to menu_procesos_flowchart_pendientes_path
  end

  private

  def set_flowcharts
    @flowcharts = FlowChart.find(params[:id])
  end

end
