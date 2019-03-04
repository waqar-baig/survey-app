# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
merchant = Merchant.find_or_create_by(name: 'John Doe', email: 'john.doe@example.com')
merchant.password = '12345678'
merchant.save
puts "Merchant created"

merchant.customers.find_or_create_by(first_name: 'Luke', last_name: 'Rights', email: 'luke.rights@example.com')
merchant.customers.find_or_create_by(first_name: 'Virat', last_name: 'Kohli', email: 'virat.kohli@example.com')
merchant.customers.find_or_create_by(first_name: 'Rohit', last_name: 'Sharma', email: 'rohit.sharma@example.com')
merchant.customers.find_or_create_by(first_name: 'Hardik', last_name: 'Pandya', email: 'hardik.pandya@example.com')
customers = merchant.customers
puts "Customers created"

product_names = %w(samsung nokia mi apple)
4.times do |i|
  feedback_form = merchant.feedback_forms.find_or_create_by(title: "Survey #{i}", status: 'active')
  question = feedback_form.questions.find_or_create_by(
    title: "How much will you rate our #{product_names[i].titleize} product?",
    question_type: 'rating',
    is_required: true,
    merchant: merchant
  )
  question.question_answers.find_or_create_by(rating: 5, merchant: merchant)
  question = feedback_form.questions.find_or_create_by(
    title: "what other products did you use from us?",
    question_type: 'multiple_choice',
    is_required: false,
    merchant: merchant
  )
  question.question_answers.find_or_create_by(answer_label: 'TV', merchant: merchant)
  question.question_answers.find_or_create_by(answer_label: 'Air Conditioner', merchant: merchant)
  question.question_answers.find_or_create_by(answer_label: 'Laptop', merchant: merchant)

  question = feedback_form.questions.find_or_create_by(
    title: "Please share your feedback?",
    question_type: 'open_ended',
    is_required: true,
    merchant: merchant
  )
  Feedback.create(merchant: merchant, customer: customers[i], feedback_form: feedback_form, status: 'sent')
  puts "Feedback sent to Customers:: #{customers[i].name}"

end

