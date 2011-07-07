# -*- encoding : utf-8 -*-
class TopicsController < Spree::BaseController
  def payment_require?
    if topic = Topic.find(params[:id])
      render :json => topic.payment.to_json
    end
  end
end
