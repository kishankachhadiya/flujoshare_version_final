class Proceso < ApplicationRecord
  belongs_to :user
  has_many :record
  has_many :flow_charts

  after_create :set_flow_chart
  after_update :set_flow_chart, if: Proc.new{|proceso|proceso.flowchart_xml_changed?}

  after_update :check_status_flow_chart, if: Proc.new{|proceso|proceso.status_changed?}

  def set_flow_chart
    self.flow_charts.where(status: 'solicitud de aprobacion').destroy_all
    self.flow_charts.create!
  end

  def check_status_flow_chart
    if self.status == "Aceptado"
      self.flow_charts.update_attributes(status: "aceptado", approved_at: Time.now)
    end
  end

end
