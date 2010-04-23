// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function booking_update_complete(req) {
  var obj =$.evalJSON( req.responseText );
	$('btnConfirm_'+obj.id).disabled=(obj.status!='booked');
  var msg=(obj.success)?'Update successful!':'Update failed!';
  alert(msg);
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
          if ( undefined == ad.Locality ) ad = ad.SubAdministrativeArea;
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

var geocoder = function(){
  var gapi = 'null';
  return {
    lookupLatLong: function(addr){
      var g = new GoogleGeocode(gapi);
      g.geocode(addr, function(data) {
        if ( data !== null ) {
          $('#church_lat').val(data.latitude); 
          $('#church_lon').val(data.longitude); 
          alert('Lat Long values loaded!');
        } else {
          alert('Error! Unable to geocode address');
        }
      })
    },
    setKey: function(key) {
      gapi = key;
    },
    getKey: function() {
      return gapi;
    }
  };
}();

