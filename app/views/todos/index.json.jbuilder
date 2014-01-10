json.array!(@todos) do |todo|
  json.extract! todo, :id, :title, :completed_at, :priority, :due_date, :order
  json.url todo_url(todo, format: :json)
end
