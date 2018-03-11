class AddImageColumnForFlowchart < ActiveRecord::Migration[5.1]
  def change
    add_column :procesos, :flowchart_image, :text
    add_column :flow_charts, :flowchart_image, :text
  end
end
