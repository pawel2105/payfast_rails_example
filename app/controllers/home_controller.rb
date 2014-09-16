class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Not sure how clever this is

  def index
  end

  def paid
    create_notification 'clientpass'

    if @notification.acknowledge
      if @notification.complete?
        render nothing: true
        # do something
      else
        render nothing: true
        # do something else
      end
    else
      head :bad_request
    end
  end

  def success
  end

  def fail
  end

private

  def create_notification(password)
    @notification = OffsitePayments.integration(:pay_fast).notification(request.raw_post, secret: Rails.configuration.offsite_payments['payfast'][password])
  end
end