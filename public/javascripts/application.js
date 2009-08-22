// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
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

function move_person(draggable_element, droppable_element, event) {
  draggable_element.parentNode.removeChild(draggable_element);
  droppable_element.appendChild(draggable_element);

  $('calc_form').request();
}
function respond_to_hover(event) {
  var element = Event.element(event);
  //those links inside are being considered the element
  //for the hover, so go up to what we intended to
  if(!element.match('li.person')) {
    element = element.up('li.person');
  }
  //remove the highlight from all people, then add it to the current person
  $$('.active_person').invoke('removeClassName', 'active_person');
  element.addClassName('active_person');
}

function show_login_register(login_register) {
  var login = $('dvlogincontainer');
  var register = $('dvregsitercontainer');

  var queue = Effect.Queues.get('login_register');
  queue.each(function(effect) { effect.cancel(); });

  if(login_register == 'login'){
    if(register.getStyle('display') != "none") {
      Effect.SlideUp(register, {queue: {scope: 'login_register'}});
    }
    Effect.toggle(login, 'slide', {queue: {scope: 'login_register'}});
  } else if(login_register == 'register'){
    if(login.getStyle('display') != "none") {
      Effect.SlideUp(login, {queue: {scope: 'login_register'}});
    }
    Effect.toggle(register, 'slide', {queue: {scope: 'login_register'}});
  }
  return false;
}

