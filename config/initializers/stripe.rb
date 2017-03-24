Rails.configuration.stripe = {
    :publishable_key => 'pk_test_3i0nFgs2UtPqvaUzt3m7rD8m',
    :secret_key => 'sk_test_R7BEMaBS13iD0hOngeiudnZl'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]