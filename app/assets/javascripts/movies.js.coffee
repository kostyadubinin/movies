$(document).on "page:change", ->
  $("#castTail").on "shown.bs.collapse", ->
    $("#cast_toggle_button").html "<i class='fa fa-angle-double-up fa-lg'></i> Less"

  $("#castTail").on "hidden.bs.collapse", ->
    $("#cast_toggle_button").html "<i class='fa fa-angle-double-down fa-lg'></i> More"

  $("#crewTail").on "shown.bs.collapse", ->
    $("#crew_toggle_button").html "<i class='fa fa-angle-double-up fa-lg'></i> Less"

  $("#crewTail").on "hidden.bs.collapse", ->
    $("#crew_toggle_button").html "<i class='fa fa-angle-double-down fa-lg'></i> More"
