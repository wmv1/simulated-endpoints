class CreateMocks < ActiveRecord::Migration[5.2]
  def change
    create_table :mocks do |t|
      t.string :path
      t.string :status
      t.string :content

      t.timestamps
    end
  end
end
