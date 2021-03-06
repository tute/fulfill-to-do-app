window.JST = {};
window.JST['todos/todo'] = _.template(
  '<div id="todo_id_<%= todo.id %>" class="todo_item" data-id="<%= todo.id %>">\
    <h3>\
      <%= todo.get("title") %>\
      <a href="#todo_form" class="edit">[Edit]</a>\
      <a href="#todo_form" class="delete">[Delete]</a>\
    </h3>\
    <% if (todo.get("completed_at")) { %>\
      Completed: <%= todo.get("completed_at") %>\
    <% } else { %>\
      <a href="#" class="complete">[Mark Completed]</a>\
    <% } %><br>\
    Due date: <%= todo.get("due_date") %><br>\
    Priority: <%= todo.get("priority") %>\
    <hr>\
  </div>'
)
