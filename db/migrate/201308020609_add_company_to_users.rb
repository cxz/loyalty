class AddCompanyToUsers < ActiveRecord::Migration
  def change
    add_belongs_to :users, :company
  end
end
