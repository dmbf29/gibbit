class Notices
  constructor: ->
    @notices = $("[data-behavior='notices']")
    @setup() if @notices.length > 0

    setup: ->
      $("[data-behavior='notices-link']").on "click", @handleClick
      $.ajax(
        url: "/notices.json"
        dataType: "JSON"
        method: "GET"
        success: @handleSuccess
      )


    handleClick: (e) =>
      $.ajax(
        url: "notices/mark_as_read"
        dataType: "JSON"
        method: "POST"
        success: ->
          $("[data-behavior='unread-count']").text(0)
      )

    handleSuccess: (data) =>
      console.log(data)
      items = $.map data, (notice) ->
        "<li><a href="#{notice.url}">#{notice.gibber} #{notice.action}</a></li>"

    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notice-items']").html(items)

JQuery ->
  new Notices
