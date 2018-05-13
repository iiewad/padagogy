# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#queryFunc = (params = '') ->
#  _that = $(this)
#  $.ajax '/apps/apps_category',
#    headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
#    type: 'POST',
#    data: params,
#    success: (res) ->
#      renderApps(res.data) if res.status is 'success'
#    error: ->
#      console.error('error')
#
#    renderApps = (data = '') ->
#      console.log('Start Render Apps Lists')
#      appLists = $('.app-lists')
#      data.forEach (elem) ->
#        str = "<div class='app-item col-xs-4 col-md-4'>"
#        str += "<a href='/app/" + elem.id + "' class='pull-left' ">
#        str += "<img src='" + elem.logo + "' />"
#
#$ ->
#  queryFunc()
#
#  $('.category-item').click (e) ->
#    $(this).toggleClass('label-primary')
#    params = new Object()
#    padagogyArr = new Array
#    subjectArr = new Array
#    gradeArr = new Array
#
#    $('ul.category li>a.label-primary').each () ->
#      # console.log($(this).data())
#      key = Object.keys($(this).data()).toString()
#      padagogyArr.push($(this).data('padagogyId')) if key is 'padagogyId'
#      subjectArr.push($(this).data('subjectId')) if key is 'subjectId'
#      gradeArr.push($(this).data('gradeId')) if key is 'gradeId'
#
#    params = {
#      'padagogy': padagogyArr,
#      'subject': subjectArr,
#      'grade': gradeArr
#    }
#
#    queryFunc(params)
#
