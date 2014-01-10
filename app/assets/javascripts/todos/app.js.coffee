$(document).ready ->
  window.TODOS = new Todos()

  window.NewTodoView = new NewTodoView
    el: $('#todo_form')
    collection: window.TODOS
  window.EditTodoView = new EditTodoView
    el: $('#todo_form')
    collection: window.TODOS

  window.ListView = new TodosView
    el: $("#todos")
    collection: window.TODOS

  # Start off as a create form
  NewTodoView.render()
