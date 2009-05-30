// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var gapi = 'ABQIAAAA4QvaOZF0TyrEiBjftCedLhSuQ5C3NrpuFfvdIEwLzD_XE8o3LRSVdrSnnSrdVxlO0vwwpXf_lEcCJg';

var booking_update_complete = function(req) {
  alert('ii');
//	alert( Object.inspect(req) );
}

$(function() {
	var tbls = $('.deputation-booking-table');
	for (i=0;i<tbls.length;i++) {
		var id = tbls[i].id.substr(11);
		toggleConfirmButton(id);
	}
});

function toggleConfirmButton(i) {
	if ( i ) {
		if ( $('booking_status_'+i).selectedIndex == 1 ) {
			$('btnConfirm_'+i).disabled=false;
		}
	}
}

function GoogleGeocode(apiKey) {
  this.apiKey = apiKey;
  this.geocode = function(address, callbackFunction) {
    $.ajax({
      dataType: 'jsonp',
      url: 'http://maps.google.com/maps/geo?output=json&oe=utf8&sensor=false' + '&key=' + this.apiKey + '&q=' + address,
      cache: false,
      success: function(data){
        if(data.Status.code==200) {
          var result = {};
          var ad = data.Placemark[0].AddressDetails.Country.AdministrativeArea;
          result.streetAddress = ad.Locality.Thoroughfare && ad.Locality.Thoroughfare.ThoroughfareName ? ad.Locality.Thoroughfare.ThoroughfareName : '';
          result.city = ad.Locality && ad.Locality.LocalityName ? ad.Locality.LocalityName : ''; 
          result.state = ad && ad.AdministrativeAreaName ? ad.AdministrativeAreaName : '';
          result.zip = ad.Locality.PostalCode && ad.Locality.PostalCode.PostalCodeNumber ? ad.Locality.PostalCode.PostalCodeNumber : '';
          result.longitude = data.Placemark[0].Point.coordinates[0];
          result.latitude = data.Placemark[0].Point.coordinates[1];
          callbackFunction(result);
        } else {
          callbackFunction(null);
        }
      }
    });
  };
}

function lookupLatLong(addr) {
  var g = new GoogleGeocode(gapi);
  g.geocode(addr, function(data) {
      if ( data !== null ) {
        $('#church_lat').val(data.latitude); 
        $('#church_lon').val(data.longitude); 
        alert('Lat Long values loaded!');
      } else {
        alert('Error! Unable to geocode address');
      }
    }
  );
}

