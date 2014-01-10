class window.TodoView extends Backbone.View
  template: window.JST['todos/todo']

  events:
    'click .edit': 'showEditForm'
    'click .complete': 'markCompleted'
    'click .delete': 'destroyModelAndView'

  initialize: ->
    @listenTo @.model, 'change', @render

  render: ->
    @.$el.html @template('todo': @.model)
    @

  markCompleted: ->
    @.model.save completed_at: @sqlDate()

  showEditForm: ->
    EditTodoView.model = @.model
    EditTodoView.render()

  destroyModelAndView: (evt) ->
    return unless confirm("¿Confirma que desea eliminar \"#{@model.get('title')}\"?")
    @model.destroy()
    @.$el.fadeOut 'fast', ->
      @.remove()

      window.JST = {}

  # Returns date today in YYYY-MM-DD format
  sqlDate: (date = new Date()) ->
    mon = @_alwaysTwoChars date.getMonth() + 1
    day = @_alwaysTwoChars date.getDate()
    "#{date.getFullYear()}-#{mon}-#{day}"

  # Takes a number, if it's 1-digit it inserts a leading zero it
  _alwaysTwoChars: (number) ->
    ret = new String(number)
    ret = "0#{ret}"  if ret.length is 1
    ret


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
