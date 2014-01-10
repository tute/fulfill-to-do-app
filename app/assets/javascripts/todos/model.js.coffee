class window.Todo extends Backbone.Model
  name: 'todo'


class window.Todos extends Backbone.Collection
  url: '/todos'
  model: Todo
  comparator: 'priority'
