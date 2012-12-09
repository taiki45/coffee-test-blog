square = (x) -> x * x
fact = (x) ->
  fact_iter = (x, y) ->
    if x <= 1
      x * y
    else
      fact_iter x - 1, x * y
  fact_iter(x, 1)

console.log fact 5

Article =
  box: ->
    $("#article_box")
  prepend_new: (id, title, body)->
    dom = $("<div>").addClass("article").append(
      $("<p>").html("id: "+id),
      $("<p>").html("title: "+title),
      $("<p>").html("body: "+body)
    )
    this.box().prepend(dom)

EditForm =
  form: ->
    $("form[name='article']")
  title: ->
    $("input[name='title']")
  content: ->
    $("textarea[name='content']")
  onSubmit: ->
    $.post(
      "/submit",
      {
        title: this.title().val(),
        content: this.content().val()
      },
      this.onSuccess,
      "json"
    )
    false
  onSuccess: (res) ->
    Article.prepend_new(res.id, res.title, res.body)

$ ->
  EditForm.form().submit -> EditForm.onSubmit()

