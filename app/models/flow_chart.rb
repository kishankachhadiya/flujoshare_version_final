class FlowChart < ApplicationRecord
  belongs_to :proceso
  belongs_to :approved_by, foreign_key: "approved_by_id", class_name: "User", optional: true

  enum status: ["solicitud de aprobacion", "aceptado", "rechazado"]

  before_create :set_flowchart_xml

  def set_flowchart_xml
    self.flowchart_xml = self.proceso.flowchart_xml
  end

  def self.last_approved(proceso_id)
    where(status: "aceptado", proceso_id: proceso_id).order("approved_at DESC").first
  end

end
