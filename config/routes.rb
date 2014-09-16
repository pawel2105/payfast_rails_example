Payfast::Application.routes.draw do
  root 'home#index'

  scope 'pay_fast' do
    post 'paid'    => 'home#paid',    as: :payfast_paid
    get 'success' => 'home#success', as: :payfast_success
    get 'fail'    => 'home#fail',    as: :payfast_fail
  end
end