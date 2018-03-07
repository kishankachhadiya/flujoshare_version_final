class AddColumnInProcesos < ActiveRecord::Migration[5.1]
  def change
    add_column :procesos, :flowchart_xml, :text
  end
end
