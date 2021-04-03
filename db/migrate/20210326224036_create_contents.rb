class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :content_type
      t.string :title
      t.text :content_review_notes
      t.integer :rating
      t.string :movie_link
      t.date :release_date

      t.timestamps
    end
    add_column :contents, :ingredients, :string, array:true, default:[] 
    add_column :contents, :steps, :string, array:true, default:[] 
  end
end
