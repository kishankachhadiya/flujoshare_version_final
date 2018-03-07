class CreateFlowCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :flow_charts do |t|
      t.belongs_to :proceso, index: true
      t.integer :approved_by_id, index: true
      t.datetime :approved_at
      t.integer :status, default: 0
      t.text :flowchart_xml

      t.timestamps
    end
  end
end
