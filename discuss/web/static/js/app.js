// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import "./socket"

document.addEventListener('DOMContentLoaded', function(){ 
  const info_flashes = document.querySelectorAll('.alert');
  if (info_flashes.length > 0) {
    for (let index = 0; index < info_flashes.length; index++) {
      const s = info_flashes[index].style;
      setTimeout(function(){ 
        s.opacity = 1;
        (function fade(){
          (s.opacity -= 0.05) < 0 ? s.display = "none" : setTimeout(fade, 20);
        })();
      }, 2300);
    }
  }
});
