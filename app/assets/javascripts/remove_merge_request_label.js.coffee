@removeMergeRequestLabel =
  init: ->
    $(".merge-request-show-labels").on "click", ".label-choice-close", ->
      label_id = $(this).attr("label_id")
      $('#merge_request_label_ids option[value="' + label_id + '"]').removeAttr("selected")
      $("#merge_request_label_ids").trigger("change")

$ ->
  removeMergeRequestLabel.init()
