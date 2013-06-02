var map;

function createGMSBaseMap(elementId) {
    var map = new OpenLayers.Map(elementId);
    map.addControl(new OpenLayers.Control.LayerSwitcher());
    map.addControl(new OpenLayers.Control.MousePosition());

    return map;
}

function addGMSLayersToMap(map) {

    function createLayerFromGeoServer(layerName, isBaseLayer, isTransparent) {
        return new OpenLayers.Layer.WMS(
                    "Vietnam Admin 0", "http://166.78.181.154:8080/geoserver/hrok/wms",
                    {
                        LAYERS: layerName,
                        STYLES: '',
                        format: 'image/png',
                        tiled: true,
                        numzoomlevels: 20,
                        tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom,
                        transparent: isTransparent
                    },
                    {
                        buffer: 0,
                        displayOutsideMaxExtent: true,    
                        yx : {'EPSG:4326' : true},
                        isBaseLayer: isBaseLayer
                    } 
                );
    }

    var grd = new OpenLayers.Layer.Google(
        "Google Road",
        {type: google.maps.MapTypeId.ROADMAP}
    );

    var VNM_adm0 = createLayerFromGeoServer('hrok:VNM_adm0', false, true);

    
    var VNM_adm2 = createLayerFromGeoServer('hrok:VNM_adm1', false, true);

    map.addLayers([grd]);

    // Google.v3 uses EPSG:900913 as projection, so we have to
    // transform our coordinates
    map.setCenter(transformLonLatToEPSG900913(108.27, 14.05), 6);
}

function transformLonLatToEPSG900913(dlon, dlat) {
    return new OpenLayers.LonLat(dlon, dlat).transform(
        new OpenLayers.Projection("EPSG:4326"),
        map.getProjectionObject()
    )
}

function setZoomAnimate(animate) {
    for (var i=map.layers.length-1; i>=0; --i) {
        map.layers[i].animationEnabled = animate;
    }
};


function addMarkerAtLonLat(map, dlon, dlat) {
    var markers = map.getLayer('markers');

    if (markers == null) {
        markers = new OpenLayers.Layer.Markers('markers');
        markers.id = 'markers';
        map.addLayer(markers);
    }

    var position = transformLonLatToEPSG900913(dlon, dlat);
    var size = new OpenLayers.Size(40,40);
    var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
    var icon = new OpenLayers.Icon('assets/mappin.png', size, offset);   

    markers.addMarker(new OpenLayers.Marker(position, icon));        
}

function init() {
    map = createGMSBaseMap('map');
    addGMSLayersToMap(map);
    setZoomAnimate(true);
    addMarkerAtLonLat(map, 108.327792, 15.880596);
    addMarkerAtLonLat(map, 108.357264, 15.886922);    
    addMarkerAtLonLat(map, 108.329197, 15.876355);
    addMarkerAtLonLat(map, 108.331343, 15.879255);

    map.events.register('click', map, function(e){
        var position = map.getLonLatFromPixel(e.xy);
        addMarkerAtLonLat(map, position.lon, position.lat);
        var coordinates = document.getElementById('coordinates');
        coordinates.innerHTML = 'Co-ordinates: ' + position.lon + '-' + position.lat; 
    });
}
