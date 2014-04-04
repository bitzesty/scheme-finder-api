# example usage:
#   window.app ||= {}
#   require csv_imports_table in application.js.coffee
#   (new app.CsvImportsTable).start_reloading()

class app.CsvImportsTable
  constructor: (table_finder = "table.csv-imports", refresh_interval = 5000) ->
    @table_finder = table_finder
    @refresh_interval = refresh_interval
    @table = $(table_finder)

  start_reloading: =>
    @interval = setInterval @reload, @refresh_interval

  spinners: =>
    @table.find(".spin")

  reload: =>
    if @spinners().length
      for spinner in @spinners()
        $spinner = $(spinner)
        url = $spinner.attr("data-url")

        $.ajax
          url: url
          dataType: "json"
          cache: false
          success: (responce) =>
            if responce.state is "completed"
              @remove_spinner($spinner, responce)
    else
      clearInterval @interval

  remove_spinner: (spinner, responce) =>
    $spinner = $(spinner)
    $table_row = $spinner.parents("tr")
    $spinner_span = $spinner.parent()

    # unhide Completed message
    $spinner_span.next().removeClass("hide").show()
    # remove spinner
    $spinner_span.remove()

    # update counts
    $table_row.find(".saved_count").html responce.saved_count
    $table_row.find(".failed_count").html responce.failed_count

    # hide pending text
    $table_row.find(".results .nothing").hide()
    # display counts
    $table_row.find(".results .final").removeClass("hide").show()
