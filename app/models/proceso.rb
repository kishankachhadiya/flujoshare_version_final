class Proceso < ApplicationRecord
  belongs_to :user
  has_many :record
  has_many :flow_charts

  after_create :set_flow_chart
  after_update :set_flow_chart, if: Proc.new{|proceso|proceso.flowchart_xml_changed?}

  def set_flow_chart
    self.flow_charts.create!
  end

end
