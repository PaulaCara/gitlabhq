@removeIssueLabel =
  init: ->
    $(".issue-show-labels").on "click", ".label-choice-close", ->
      label_id = $(this).attr("label_id")
      $('#issue_label_ids option[value="' + label_id + '"]').removeAttr("selected")
      $("#issue_label_ids").trigger("change")

$ ->
  removeIssueLabel.init()
