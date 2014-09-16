require 'offsite_payments'
require 'offsite_payments/action_view_helper'

ActionView::Base.send(:include, OffsitePayments::ActionViewHelper)
OffsitePayments.mode = :test # for testing server
Rails.configuration.offsite_payments = YAML.load_file("#{Rails.root}/config/payfast.yml")