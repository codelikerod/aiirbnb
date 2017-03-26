Rails.configuration.stripe = {
  :publishable_key => 'pk_test_3iKLFqhcqTybmXpSupzVM01P',
  :secret_key      => 'sk_test_mA2sEllOeICb5XaNh1rKSgxz'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
