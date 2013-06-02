var map;

function init() {
    map = new OpenLayers.Map('map');
    map.addControl(new OpenLayers.Control.LayerSwitcher());
    map.addControl(new OpenLayers.Control.MousePosition());
    
    var grd = new OpenLayers.Layer.Google(
        "Google Road",
        {type: google.maps.MapTypeId.ROADMAP}
    );

    var bounds = new OpenLayers.Bounds(
                    102.14499664306652, 8.563331604003906,
                    109.46942901611376, 23.39273071289076
                );

    var options = {
    controls: [],
    maxExtent: bounds,
    maxResolution: 0.0579273402690893,
    projection: "EPSG:4326",
    units: 'degrees'
    };

    var VNM_adm0 = new OpenLayers.Layer.WMS(
                    "Vietnam Admin 0", "http://166.78.181.154:8080/geoserver/hrok/wms",
                    {
                        LAYERS: 'hrok:VNM_adm0',
                        STYLES: '',
                        format: 'image/png',
                        tiled: true,
                        numzoomlevels: 20,
                        tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom,
                        transparent: true
                    },
                    {
                        buffer: 0,
                        displayOutsideMaxExtent: true,    
                        yx : {'EPSG:4326' : true},
                        isBaseLayer: false
                    } 
                );

    var VNM_adm1 = new OpenLayers.Layer.WMS(
                    "Vietnam Admin 1", "http://166.78.181.154:8080/geoserver/hrok/wms",
                    {
                        LAYERS: 'hrok:VNM_adm1',
                        STYLES: '',
                        format: 'image/png',
                        tiled: true,
                        numzoomlevels: 20,
                        tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom,
                        transparent: true
                    },
                    {
                        buffer: 0,
                        displayOutsideMaxExtent: true,    
                        yx : {'EPSG:4326' : true},
                        isBaseLayer: false
                    } 
                );

    var VNM_adm2 = new OpenLayers.Layer.WMS(
                    "Vietnam Admin 2", "http://166.78.181.154:8080/geoserver/hrok/wms",
                    {
                        LAYERS: 'hrok:VNM_adm2',
                        STYLES: '',
                        format: 'image/png',
                        tiled: true,
                        numzoomlevels: 20,
                        tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom,
                        transparent: true
                    },
                    {
                        buffer: 0,
                        displayOutsideMaxExtent: true,    
                        yx : {'EPSG:4326' : true},
                        isBaseLayer: false
                    } 
                );

    map.addLayers([grd, VNM_adm0, VNM_adm1, VNM_adm2]);

    // Google.v3 uses EPSG:900913 as projection, so we have to
    // transform our coordinates
    map.setCenter(new OpenLayers.LonLat(108.27, 14.05).transform(
        new OpenLayers.Projection("EPSG:4326"),
        map.getProjectionObject()
    ), 6);
    
    // add behavior to html
    var animate = document.getElementById("animate");
    animate.onclick = function() {
        for (var i=map.layers.length-1; i>=0; --i) {
            map.layers[i].animationEnabled = this.checked;
        }
    };

    var markers = null;

    map.events.register("click", map, function(e){
        var position = map.getLonLatFromPixel(e.xy);
        OpenLayers.Util.getElement('coordinates').innerHTML = 'Co-ordinates: ' + position.lon.toFixed(3) + ',' + position.lat.toFixed(3) + ' Layers: ' + map.getNumLayers();

        markers = map.getLayer('markers');

        if (markers == null) {
            markers = new OpenLayers.Layer.Markers('markers');
            markers.id = 'markers';
            map.addLayer(markers);
        }

        var size = new OpenLayers.Size(40,40);
        var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
        var icon = new OpenLayers.Icon('../images/pushpin.png', size, offset);   

        markers.addMarker(new OpenLayers.Marker(position, icon));        
    });
}
