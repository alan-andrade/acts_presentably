ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table :posts, :force => true do |t|
    t.string :title
    t.string :text
    t.timestamps
  end
end