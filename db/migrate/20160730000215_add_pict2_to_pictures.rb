class AddPict2ToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :pict2, :string
  end
end
