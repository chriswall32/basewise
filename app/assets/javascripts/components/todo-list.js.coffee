$ ->
  TodoListUI = flight.component(
    ->
      @defaultAttrs
        newTodoSelector: "[data-action='new-todo']"
        createTodoSelector: "[data-action='create-todo']"
        cancelSelector: "[data-action='cancel']"
        titleSelector: "[data-action='title']"
        descriptionSelector: "[data-action='description']"
        todoContainer: "[data-container='new-todo']"

      @showNewTodo = (ev, data) ->
        @select("todoContainer").show()

      @hideNewTodo= (ev, data) ->
        @select("todoContainer").hide()

      @after "initialize", ->
        @on "click",

          newTodoSelector: @showNewTodo
          cancelSelector: @hideNewTodo
  )
  TodoListUI.attachTo("[data-component='todo-list']")