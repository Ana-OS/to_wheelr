class AddcolumnToBicycles < ActiveRecord::Migration[7.0]
  def change
    add_reference :bicycles, :user, index: true
  end
end
