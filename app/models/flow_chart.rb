class FlowChart < ApplicationRecord
  belongs_to :proceso
  belongs_to :approved_by, foreign_key: "approved_by_id", class_name: "User", optional: true

  enum status: [:pending, :accepted, :rejected]

  before_create :set_flowchart_xml

  scope :last_approved, -> {where(status: "accepted").order("approved_at DESC").first}

  def set_flowchart_xml
    self.flowchart_xml = self.proceso.flowchart_xml
  end

end
