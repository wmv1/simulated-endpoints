class AddTimeoutToMocks < ActiveRecord::Migration[5.2]
  def change
    add_column :mocks, :timeout, :integer
  end
end
