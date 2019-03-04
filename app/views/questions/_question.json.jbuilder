json.extract! question, :id, :title, :question_type, :is_required, :merchant_id, :created_at, :updated_at
json.url question_url(question, format: :json)
