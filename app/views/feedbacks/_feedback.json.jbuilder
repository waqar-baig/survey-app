json.extract! feedback, :id, :feedback_form_id, :rating, :value, :customer_id, :merchant_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
