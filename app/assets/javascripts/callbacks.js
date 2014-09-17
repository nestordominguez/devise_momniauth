# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery(function() {
  return $.ajax({
    url: 'https://apis.google.com/js/client:plus.js?onload=gpAsyncInit',
    dataType: 'script',
    cache: true
  });
});

window.gpAsyncInit = function() {
  $('.googleplus-login').click(function(e) {
    e.preventDefault();
    gapi.auth.authorize({
      immediate: true,
      response_type: 'code',
      cookie_policy: 'single_host_origin',
      client_id: '197077783653-780i79ovk8hes2sh69lkd2p6fnq914a6.apps.googleusercontent.com',
      //client_secret: '0T8jlCCffZHZ51zeMS3fsi7t ',
      scope: 'email profile'
    }, function(response) {
      if (response && !response.error) {
        // google authentication succeed, now post data to server and handle data securely
        jQuery.ajax({type: 'POST', url: "/auth/google_oauth2/callback", dataType: 'json', data: response,
          success: function(json) {
            // response from server
          }
        });
      } else {
        // google authentication failed
      }
    });
  });
};
