window.JST = {};
window.JST['todos/todo'] = _.template(
  '<div id="todo_id_<%= todo.id %>" class="todo_item">\
    <h3>\
      <%= todo.get("title") %>\
      <a href="#" class="edit">[Edit]</a>\
      <a href="#" class="delete">[Delete]</a>\
    </h3>\
    Completed: <%= todo.get("completed_at") %><br>\
    Due date: <%= todo.get("due_date") %>\
    <hr>\
  </div>'
)
