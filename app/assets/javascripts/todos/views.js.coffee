class window.TodoView extends Backbone.View
  template: window.JST['todos/todo']

  events:
    'click .edit': 'showEditForm'
    'click .delete': 'destroyModelAndView'

  initialize: ->
    @listenTo @.model, 'change', @render

  render: ->
    @.$el.html @template('todo': @.model)
    @

  showEditForm: ->
    EditTodoView.model = @.model
    EditTodoView.render()

  destroyModelAndView: (evt) ->
    return unless confirm("¿Confirma que desea eliminar \"#{@model.get('title')}\"?")
    @model.destroy()
    @.$el.fadeOut 'fast', ->
      @.remove()


class window.TodosView extends Backbone.View
  el: '#todos'

  initialize: (options) ->
    @collection.on 'reset', @renderAll, this
    @collection.on 'add', @renderOne, this

  renderAll: (todos) ->
    todos.each @renderOne

  renderOne: (todo) ->
    view = new TodoView(model: todo)
    $(@el).append view.render().el
    @
