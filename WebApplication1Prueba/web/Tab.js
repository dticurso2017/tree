$(document).ready(function () {
 var tabID = 1;
  var nextTab = $('#tab-list li').length + 1;

 $('.btn-add-tab').click(function () {
  tabID++;
  $('#tab-list').append($('<li><a href="#tab' + tabID + '" role="tab" data-toggle="tab">Tab ' + tabID + '<button class="close" type="button" title="Remove this page">×</button></a></li>'));
  //$('#tab-content').append($('<div class="tab-pane fade" id="tab' + tabID + '">Tab ' + tabID + ' content</div>'));
  $('<div class="tab-pane" id="tab'+tabID+'">Tab' +tabID+' contenido</div>').appendTo('.tab-content');

 });
 $('#tab-list').on('click', '.close', function () {
  var tabID = $(this).parents('a').attr('href');
  $(this).parents('li').remove();
  $(tabID).remove();

  //display first tab
  var tabFirst = $('#tab-list a:first');
  tabFirst.tab('show');
 });
});















/*$( document ).ready(function() {
 $('.btnAdd').click(function (e) {
 var nextTab = $('#tabs li').length + 1;
 
 // create the tab
 $('<li><a href="#tab'+nextTab+'" data-toggle="tab">Tab '+nextTab+'<span class="close">×</span>'+'</a></li>').appendTo('#tabs');
 
 // create the tab content
 $('<div class="tab-pane" id="tab'+nextTab+'">Tab' +nextTab+' contenido</div>').appendTo('.tab-content');
 
 // make the new tab active
 $('#tabs a:last').tab('show');
 });
 
 });
 
 
 $( document ).ready(function() {
 $('.close').click(function (e) {
 //there are multiple elements which has .closeTab icon so close the tab whose close icon is clicked
 var tabContentId = $(this).parent().attr("href");
 $(this).parent().parent().remove(); //remove li of tab
 $('#myTab a:last').tab('show'); // Select first tab
 $(tabContentId).remove(); //remove respective tab content
 });
 
 });*/


 