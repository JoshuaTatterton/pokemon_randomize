$(document).ready( function() {

  $(".roll").click(function() {
    var id = $(this).attr("id");
    var player = id[0];
    var pokemon = id[1];
    var image;

    $(this).hide();

    for (i=1; i<20; i++) {
      var wait = ( (Math.pow(i, 2) * (5 / 380)) - (0.0131578947 * i) ) * 1000;
        
      setTimeout( function() {
        rand = (Math.floor((Math.random() * 721) + 1));
        

        if (rand < 10) {
          rand = "00" + rand;
        } else if (rand < 100) {
          rand = "0" + rand;
        }

        $.get("randomize/"+rand, function(data) {
          var img = $("<img />").attr("src", data.pokemon);

          $(".image#" + id).html(img);
        });
        

      }, wait);

    }
    
  });

});