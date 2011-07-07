# -*- encoding : utf-8 -*-
class Contact < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :order_number, :format => {:with => /(^$)|(^R\d{9}$)/i, :message => I18n.t("invalid_order_number")}
  
  belongs_to :topic
 
end
