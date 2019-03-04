json.extract! feedback_form, :id, :title, :status, :merchant_id, :created_at, :updated_at
json.url feedback_form_url(feedback_form, format: :json)
