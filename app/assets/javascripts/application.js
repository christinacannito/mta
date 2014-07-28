// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
// 
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
<<<<<<< HEAD
//= require bootstrap
=======
>>>>>>> demo
//= require_tree .
//= require turbolinks



//Flying Letters script- by Matthias (info@freejavascripts.f2s.com)
// Modified by Twey for efficiency and compatibility
//For this script and more, visit Dynamic Drive: http://www.dynamicdrive.com

//Configure message to display. Use "$" for linebreak
//By default, set to just grab the text from element with ID="fly"


var timeout = 500;
var closetimer  = 0;
var ddmenuitem  = 0;

// open hidden layer
function mopen(id)
{ 
  // cancel close timer
  mcancelclosetime();

  // close old layer
  if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

  // get new layer and show it
  ddmenuitem = document.getElementById(id);
  ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
  if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
  closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
  if(closetimer)
  {
    window.clearTimeout(closetimer);
    closetimer = null;
  }
}
<<<<<<< HEAD

// close layer when click-out
document.onclick = mclose; 
=======

// close layer when click-out
document.onclick = mclose; 

// $('#myModal').modal('show')
>>>>>>> demo
