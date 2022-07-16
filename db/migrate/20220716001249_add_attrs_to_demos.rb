class AddAttrsToDemos < ActiveRecord::Migration[7.0]
  def change
    add_column :demos, :description, :string
  end
end
