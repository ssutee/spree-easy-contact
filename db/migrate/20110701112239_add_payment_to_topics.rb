# -*- encoding : utf-8 -*-
class AddPaymentToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :payment, :boolean
  end

  def self.down
    remove_column :topics, :payment
  end
end
