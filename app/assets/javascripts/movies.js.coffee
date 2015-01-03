$(document).on "page:change", ->
  $("#castListTail").on "shown.bs.collapse", ->
    $("#cast_toggle_button").html "<i class='fa fa-angle-double-up fa-lg'></i> Less"

  $("#castListTail").on "hidden.bs.collapse", ->
    $("#cast_toggle_button").html "<i class='fa fa-angle-double-down fa-lg'></i> More"

  $("#crewListTail").on "shown.bs.collapse", ->
    $("#crew_toggle_button").html "<i class='fa fa-angle-double-up fa-lg'></i> Less"

  $("#crewListTail").on "hidden.bs.collapse", ->
    $("#crew_toggle_button").html "<i class='fa fa-angle-double-down fa-lg'></i> More"
