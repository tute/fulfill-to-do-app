class window.TodoFormView extends Backbone.View
  el: '#todo_form'

  onFormSubmit: (evt) ->
    evt.preventDefault()
    @.model.set @submitHash()
    if @.model.isValid()
      @saveModel()
      @clearInputs()
      # Reset to new todo form
      NewTodoView.render()
    else
      @renderErrors @.model.validationError, 'todo'

  saveModel: ->
    if @.model.isNew()
      @collection.create @.model
    else
      @.collection.get(@.model.id).save @submitHash()

  submitHash: ->
    hash =
      title: @.$('#todo_title').val()
      completed_at: @.$('#todo_completed_at').val()
      due_date: @.$('#todo_due_date').val()
      priority: @.$('#todo_priority').val()
    hash['id'] = @.$('#todo_id').val() if @.$('#todo_id').val()
    hash

  clearInputs: ->
    @.$('input[type=text], input[type=number]').val ''


class window.NewTodoView extends TodoFormView
  events:
    'submit form': 'onFormSubmit'

  render: ->
    @clearInputs()
    @.model = new @collection.model()
    @.$('#todo_id').val ''
    @.$('form').addClass 'create'
    @.$('form').removeClass 'edit'
    @.$('input[type=submit]').val "Crear Item"
    @


class window.EditTodoView extends TodoFormView
  render: ->
    @populateFields()
    @markForEdit()

  populateFields: ->
    @.$('#todo_id').val    @.model.get('id')
    @.$('#todo_title').val @.model.get('title')
    @.$('#todo_completed_at').val @.model.get('completed_at')
    @.$('#todo_due_date').val @.model.get('due_date')
    @.$('#todo_priority').val @.model.get('priority')

  markForEdit: ->
    @.$('form').removeClass 'create'
    @.$('form').addClass 'edit'
    @.$('legend span').text @model.get('title')
    @.$('input[type=submit]').val 'Guardar Item'
