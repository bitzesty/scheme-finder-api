# scheme-finder-api namespace
window.sfa ||= {}

sfa.activate_link = ($link, up_to_element = "ul") ->
  $link.closest(up_to_element).find("a").removeClass("active")
  $link.addClass("active")

sfa.apply_content_load_js = ($context) ->
  $context ||= $("body")

  $(".alert").delay(5000).fadeOut("slow")

  selected = $(".radio-collection span").index($(".radio-collection input:checked").closest("span"))
  for s in [0..selected]
    $(".radio-collection span:eq("+s+") input").addClass("active")
  $(".radio-collection input").on("change", -> (
    selected = $(".radio-collection span").index($(this).closest("span"))
    $(".radio-collection input.active").removeClass("active")
    for s in [0..selected]
      $(".radio-collection span:eq("+s+") input").addClass("active")
  ))

  #########
  ## Select2
  for select in $context.find("select.js-select2")
    options = {
      width: 'resolve',
    }
    # has placeholder and empty option
    if $(select).filter("[placeholder]").find("option[value='']").length
      allow_clear_options =
        placeholder: "",
        allowClear: true,
      $.extend(options, allow_clear_options)

    $(select).select2 options
  ## [END] Select2
  #########
