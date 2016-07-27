class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :content
      t.binary :pict

      t.timestamps null: false
    end
  end
end
