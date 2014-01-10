user = User.create!(
  email: 'tutecosta@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
other_user = User.create!(
  email: 'anonymus@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Todo.create([{
  title: 'Accomplished what I planed',
  completed_at: Time.now,
  due_date: Date.tomorrow,
  priority: 5,
  user: user
}, {
  title: 'The Next Plan',
  due_date: 2.days.from_now,
  priority: 3,
  user: user
}, {
  title: 'Shouldn\'t be seen by Tute',
  user: other_user
}])
