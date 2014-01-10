window.JST = {};
window.JST['todos/todo'] = _.template(
  '<div id="todo_id_<%= todo.id %>" class="todo_item">\
    <h3>\
      <%= todo.get("title") %>\
      <a href="#" class="edit">[Edit]</a>\
      <a href="#" class="delete">[Delete]</a>\
    </h3>\
    <% if (todo.get("completed_at")) { %>\
      Completed: <%= todo.get("completed_at") %>\
    <% } else { %>\
      <a href="#" class="complete">[Mark Completed]</a>\
    <% } %><br>\
    Due date: <%= todo.get("due_date") %>\
    <hr>\
  </div>'
)
