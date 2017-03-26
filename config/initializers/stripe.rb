Rails.configuration.stripe = {
  :publishable_key => 'pk_test_NpWo80TSmZ6eBuy8qFvHdIYR',
  :secret_key      => 'sk_test_iOhSft8bOAjxKRr1Xd4TTOuQ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
