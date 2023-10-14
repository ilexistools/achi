function browser_get_device_pixel_ratio() {
    return window.devicePixelRatio || 1;
}

function browser_stretch_canvas_ext(canvas_id, w, h) {
    var el = document.getElementById(canvas_id);
    el.style.width = w + "px";
    el.style.height = h + "px";
}


function resize_canvas(width,height) {
    var displayWidth = window.innerWidth;
    var displayHeight = window.innerHeight;
    scale_canvas(width, height, displayWidth, displayHeight);
}

function resize_game(width,height,displayWidth,displayHeight) {
    //var displayWidth = window.innerWidth;
    //var displayHeight = window.innerHeight;
    scale_canvas(width, height, displayWidth, displayHeight);
}

function scale_canvas(baseWidth, baseHeight, targetWidth, targetHeight) {
    var aspect = (baseWidth / baseHeight);
 
    // Calculate pixel ratio and new canvas size
    var pixelRatio = window.devicePixelRatio || 1;
    var backStoreRatio = (g_CurrentGraphics.webkitBackingStorePixelRatio || g_CurrentGraphics.mozBackingStorePixelRatio || g_CurrentGraphics.msBackingStorePixelRatio ||
                          g_CurrentGraphics.oBackingStorePixelRatio || g_CurrentGraphics.backingStorePixelRatio || 1);
    var pixelScale = pixelRatio / backStoreRatio;
 
    var scaledWidth = targetWidth * pixelScale;
    var scaledHeight = targetHeight * pixelScale;
 
    var posx = 0;
    var posy = 0;
    if ((scaledWidth / aspect) > scaledHeight) {
        var sW = scaledWidth;
        scaledWidth = scaledHeight * aspect;
        posx = Math.round(((sW - scaledWidth) / pixelScale) / 2);
        scaledWidth = Math.round(scaledWidth);
    } else {
        var sH = scaledHeight;
        scaledHeight = scaledWidth / aspect;
        posy = Math.round(((sH - scaledHeight) / pixelScale) / 2);
        scaledHeight = Math.round(scaledHeight);
    }
 
    // Update canvas size
    var ret = '{"w":'+scaledWidth+',"h":'+scaledHeight+',"x":'+posx+',"y":'+posy+'}';
    eval("gml_Script_gmcallback_window_set_size(null,null,'"+ret+"')");
 
    // Scale back canvas with CSS
    if(pixelScale != 1) {
        canvas.style.width = (scaledWidth / pixelScale) + "px";
        canvas.style.height = (scaledHeight / pixelScale) + "px";
    } else {
        canvas.style.width = "";
        canvas.style.height = "";
    }
 
    // Update canvas scale
    if(typeof g_CurrentGraphics.scale === "function")
        g_CurrentGraphics.scale(pixelScale, pixelScale);
	
}

function browser_fullscreen(){
	 browser_togglefullscreen(document.body);
}


function browser_isfullscreen() {
	var elem = document.body;
    // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
    if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
        return false;
    } else {
        return true;
    }
}

function browser_togglefullscreen(elem) {
    // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
    if ((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if (document.documentElement.requestFullScreen) {
            document.documentElement.requestFullScreen();
        } else if (document.documentElement.mozRequestFullScreen) {
            document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullScreen) {
            document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        }
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
    }
}








