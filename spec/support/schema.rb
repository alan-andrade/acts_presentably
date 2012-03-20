ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table :posts, :force => true do |t|
    t.string :title
    t.string :text
    t.integer :author_id
    t.timestamps
  end

  create_table :authors, :force => true do |t|
    t.string :name
    t.timestamps
  end
end