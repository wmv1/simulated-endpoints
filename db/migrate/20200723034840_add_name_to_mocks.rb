class AddNameToMocks < ActiveRecord::Migration[5.2]
  def change
    add_column :mocks, :name, :string
  end
end
