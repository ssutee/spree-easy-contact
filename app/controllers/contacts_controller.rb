# -*- encoding : utf-8 -*-
class ContactsController < Spree::BaseController
  #before_filter :load_topics
  include SessionsHelper
  
  def new
    @topics = Topic.where(:payment => 0)    
    @contact = Contact.new
  end

  def confirm_payment
    if current_user.nil?
      #redirect_to(login_path, :notice => t("unauthenticated", :scope => 'devise.failure'))
      deny_access
    else
      @topics = Topic.where(:payment => 1)    
      @contact = Contact.new
    end
  end  
  
  def edit
    @topics = Topic.where(:payment => 0)
    redirect_to new_contact_path
  end
  
  def create
    @topics = Topic.where(:payment => 0)
    @contact = Contact.new(params[:contact] || {})
    respond_to do |format|
      if @contact.valid? &&  @contact.save
        ContactMailer.message_email(@contact).deliver
        format.html { redirect_to(root_path, :notice => t("message_sended")) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  private
  def load_topics
    @topics = Topic.all
  end

end
