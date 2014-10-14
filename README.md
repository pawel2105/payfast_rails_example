How to use this repository
==========================

* Clone this repo: `git clone git@github.com:pawel2105/payfast_rails_example.git`
* run `bundle install`
* Install [Ngrok](https://ngrok.com/)
* start your server using `rails s`
* start up ngrok and expose the port your server is running on (3000)
* replace NGROK_URL in `home/index.html.erb` with your ngrok url
* Click purchase button and be redirected to payfast

Explanation
===========

This is a simple application that shows you how to get going with Payfast using Ruby on Rails. It uses the `offsite_payments` gem to build up the form but it's not strictly necessary. The `home/index` view has a fake shopping cart table as well as the form that submits to Payfast. The table is just a visual demo and is not tied to the form at all.

The configuration for the form is in `/config/initializers/offsite_payments.rb` which loads up the test server credentials located in `/config/payfast.yml`. You'll want to change these to your credentials at some stage. You'll also want to remove the following line from the offsite payments configuration file:

    `OffsitePayments.mode = :test`

The `views/home` folder has two additional view files, `fail` as well as `success` which can be used as the views loaded in when the post-purchase callbacks fire off. You can see that they are setup in the routes file.

The `HomeController` manages the payment via the `paid` action. A notification is set up via the Payfast gateway in the `OffsitePayments` module. Once the notification is both acknowledged and completed (checked using the offsite payments public methods), you can handle the payment on your end where the comments are.

Caveat
======

This was a quick spike and to get the requests working I added the `skip_before_action :verify_authenticity_token` callback to the controller which you will **not** want to do in production. If I have time I'll fix that and update this repo.