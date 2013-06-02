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
    map.setCenter(transformLonLatToEPSG900913(108.27, 14.05), 7);
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
    var icon = new OpenLayers.Icon('/assets/mappin.png', size, offset);

    markers.addMarker(new OpenLayers.Marker(position, icon));        
}

function addMarkerVector(map, vectorName) {
    var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
    renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;
    
    var vectorLayer = new OpenLayers.Layer.Vector(vectorName, {
        styleMap: new OpenLayers.StyleMap({'default':{
            strokeColor: '#00FF00',
            strokeOpacity: 1,
            strokeWidth: 3,
            fillColor: '#FF5500',
            fillOpacity: 0.5,
            pointRadius: 6,
            pointerEvents: 'visiblePainted',
            // label with \n linebreaks
            label : 'Name: ${name}\n\nAddress: ${address}',            
            fontColor: '${favColor}',
            fontSize: '12px',
            fontFamily: 'Courier New, monospace',
            fontWeight: 'bold',
            labelAlign: '${align}',
            labelXOffset: '${xOffset}',
            labelYOffset: '${yOffset}',
            labelOutlineColor: 'white',
            labelOutlineWidth: 3
        }}),
        renderers: renderer
    });

    map.addLayer(vectorLayer);
    return vectorLayer;
}

function addMarkerEntry(map, vectorLayer, dlon, dlat, name, address) {

    var position = transformLonLatToEPSG900913(dlon, dlat);
    var pixel = map.getPixelFromLonLat(position);
    var point = new OpenLayers.Geometry.Point(pixel.x, pixel.y);
    var pointFeature = new OpenLayers.Feature.Vector(point);
    pointFeature.attributes = {
        name: name,
        age: address,
        favColor: 'red',
        align: 'cm'
    };
    vectorLayer.drawFeature(pointFeature);
    vectorLayer.addFeatures([pointFeature]);
}

function addMarkers(map, lonLatList) {
    var length = lonLatList.length;
    for (var i = 0; i < length; i++) {
        addMarkerAtLonLat(map, lonLatList[i].geo_dlong, lonLatList[i].geo_dlat);
    }
}

function init(lonLatDetails) {
    map = createGMSBaseMap('map');
    addGMSLayersToMap(map);
    setZoomAnimate(true);

//    var lonLatDetails = [{lon : 108.327792, lat: 15.880596}, {lon : 108.357264, lat : 15.886922},
//                         {lon : 108.329197, lat : 15.876355}];

    addMarkers(map, lonLatDetails);
    /*var markerVector = addMarkerVector(map, 'MarkerVector');
    addMarkerEntry(map, markerVector, 108.327792, 15.880596, 'xyz', 'vietnam');*/

    map.events.register('click', map, function(e){
        var position = map.getLonLatFromPixel(e.xy);
        addMarkerAtLonLat(map, position.lon, position.lat);
        var coordinates = document.getElementById('coordinates');
        coordinates.innerHTML = 'Co-ordinates: ' + position.lon + '-' + position.lat; 
    });
}
