class DropPortfolios < ActiveRecord::Migration[5.1]
  def change
  	drop_table :portfolios
  end
end
