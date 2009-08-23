// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//for the charts
var points = [];

//for the javascript add
function insert_fields(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}

function remove_fields(link) {
  var hidden_field = $(link).previous("input[type=hidden]");
  if (hidden_field) {
    hidden_field.value = '1';
  }
  $(link).up(".fields").hide();
}

//to manually move from list to jar
function move_person(draggable_element, droppable_element, event) {
  draggable_element.parentNode.removeChild(draggable_element);
  droppable_element.appendChild(draggable_element);

  $('calc_form').request();
}

//to set the person as active for styling
//and for chart drawing delay
function respond_to_hover(event, id) {
  var element = Event.element(event);
  //those links inside are being considered the element
  //for the hover, so go up to what we intended to
  if(!element.match('li.person')) {
    element = element.up('li.person');
  }
  //remove the highlight from all people, then add it to the current person
  $$('.active_person').invoke('removeClassName', 'active_person');
  element.addClassName('active_person');

  draw_graph(id);
}

//so that the button says login or register depending
//and the animations are queued so they dont go choppy
function show_login_register(login_register) {
  var login = $('dvlogincontainer');
  var register = $('dvregistercontainer');

  var queue = Effect.Queues.get('login_register');
  queue.each(function(effect) { effect.cancel(); });

  if(login_register == 'login'){
    if(register.getStyle('display') != "none") {
      Effect.SlideUp(register, {
        queue: {scope: 'login_register'},
        afterFinish: function(){Effect.toggle(login, 'slide', {queue: {scope: 'login_register'}})}
      });
    } else {
      Effect.toggle(login, 'slide', {queue: {scope: 'login_register'}});
    }
  } else if(login_register == 'register'){
    if(login.getStyle('display') != "none") {
      Effect.SlideUp(login, {
        queue: {scope: 'login_register'},
        afterFinish: function(){Effect.toggle(register, 'slide', {queue: {scope: 'login_register'}})}
      });
    } else {
      Effect.toggle(register, 'slide', {queue: {scope: 'login_register'}});
    }
  }
  return false;
}

//for the delay chart drawing
function draw_graph(id) {
  if($('graph_box_' + id).empty()){
    Flotr.draw(
      $('graph_box_' + id),
      [
        { // => first series
          data: [ [0, 0], [1, 2], [2, 4], [3, 6], [4, 8] ],
          label: "y = 2x",
          lines: {show: true, fill: true},
          points: {show: true}
        },
        { // => second series
          data: [ [0, 2.5], [1, 5.5], [2, 8.5], [3, 11.5], [4, 14.5] ],
          label: "y = 2.5 + 3x"
        }
      ],
      {
        selection: {
          mode: 'x', 		// => null, 'x', 'y' or 'xy'
          color: '#B6D9FF', 	// => color of the selection box
          fps: 10 		// => frames-per-second to draw the selection box.
        },
        mouse: {
          track: true,		// => true to track mouse
          position: 'se',		// => position to show the track value box
          //trackFormatter: defaultTrackFormatter,	// => fn: int -> string
          margin: 3,		// => margin for the track value box
          color: '#ff3f19',	// => color for the tracking points, null to hide points
          trackDecimals: 1,	// => number of decimals for track values
          radius: 3,		// => radius of the tracking points
          sensibility: 2		// => the smaller this value, the more precise you've to point with the mouse
        }
      }
    );
  }
}
