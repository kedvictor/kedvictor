var show2_domain = 'http://kassa.2show.mobi';
//var show2_domain = 'http://localhost:3000';
var show2_body_overflow_backup = '';
var show2_html_overflow_backup = '';
var show2_body_position_backup = '';

function show2_exec(command) {
    if (command == 'close') {
        show2_hide();
    }
}

function isMobile() {
  var a = (navigator.userAgent || navigator.vendor || window.opera);
  return /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino|android|ipad|playbook|silk/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))
}

function isSafari(){
  return /Safari/.test(navigator.userAgent) && /Apple Computer/.test(navigator.vendor);
}

function isLowResolution() {
  if ( typeof( window.innerWidth ) == 'number' ) {
    if (window.innerWidth <= 800 && window.innerHeight <= 600) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

function show2_show(partner_id, wg_params) {

   if ( isMobile() || isSafari() || isLowResolution() ) {
    var qparams = show2_prepare_params(partner_id, wg_params);
    window.open(show2_domain + "/picker/widget?" + qparams + "&amp;use_method=inside");
    return false;
   }

   if (document.getElementById('2show_container') == null) {
        var width = 1016;
        var height = 650;

        var windowWidth = 0, windowHeight = 0;
        if( typeof( window.innerWidth ) == 'number' ) {
            //Non-IE
            windowWidth = window.innerWidth;
            windowHeight = window.innerHeight;
        } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
            //IE 6+ in 'standards compliant mode'
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
            //IE 4 compatible
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }

        for (var i = 0; i < wg_params.length; i++) {
            key = wg_params[i];
            if (key[0] == 'width') {
                width = Math.max(parseInt(key[1]),width);
            } else {
                if (key[0] == 'height') {
                    height = Math.max(parseInt(key[1]),height);
                }
            }
        }

        width = Math.min(width, windowWidth);
        height = Math.min(height, windowHeight);

        var params = show2_prepare_params(partner_id, wg_params);

        var html = '';
        html += '<div id="2show_iframe_loading" style="position: absolute; width: ' + width + 'px; height: ' + height + 'px; text-align: center; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: #FEFEFE; display: block; ">';
        html += '<img src="' + show2_domain + '/images/loading.gif" style="margin-top: ' + (Math.round(height/2) - 70) + 'px; height: 65px; width: 65px;">';
        html += '<p style="font:bold 16px Arial, Helvetica, sans-serif; color: black;text-indent: 0px;padding-top: 10px;margin: 20px;text-align: center;">&#1055;&#1086;&#1076;&#1086;&#1078;&#1076;&#1080;&#1090;&#1077;, &#1087;&#1086;&#1078;&#1072;&#1083;&#1091;&#1081;&#1089;&#1090;&#1072;</p>';
        html += '</div>';
        html += '<iframe id="2show_iframe" style="width: ' + width + 'px; height: ' + height  + 'px; display: none; position: absolute;" scrolling="no" frameborder="0" allowtransparency="true" onload="show2_hide_loading();"></iframe>';
            
        var scrollTop = 0;
        var scrollLeft = 0;
        scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
        scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);        
			
        var content_back = document.createElement('div');
        content_back.setAttribute("id", "2show_container");        
        content_back.style.cssText = "display: block; border:none; zIndex:65010; background:url('" + show2_domain + "/images/transparentbg.png'); position:absolute; width:100%; height:100%; padding:0px; margin:0px; left:" + scrollLeft + "px; top:" + scrollTop + "px;";
        var div = document.createElement('div');
        div.setAttribute("id", "2show_container_inner");
        div.style.cssText = "position: absolute; width: " + width + "px; height: " + height + "px; padding: 8px; left: 50%; top: 50%; margin-left: -" + (width/2) + "px; margin-top: -" + (height/2) + "px; display: block; border: none; overflow-y: hidden; overflow-x: hidden; background: url(" + show2_domain + "/images/module_bg.png) repeat; z-index: 65010;"
        div.innerHTML = html;
        content_back.appendChild(div);
        document.body.appendChild(content_back);
        
        if (typeof(document.html) !== 'undefined') {
            show2_html_overflow_backup = document.html.style.overflow;
            document.html.style.overflow = null;
        }
        show2_body_overflow_backup = document.body.style.overflow;
        document.body.style.overflow = 'hidden';
        show2_body_position_backup = document.body.style.position;
        document.body.style.position = 'static';
        if (document.all) {
            document.body.scroll = 'no';
            if (typeof(document.html) !== 'undefined') {
                document.html.scroll = 'no';
            }
        }	
                
        document.getElementById("2show_iframe").src = show2_domain + "/picker/widget?" + params + "&amp;use_method=infront";
    }
    return false;
}

function show2_show_inside(partner_id, wg_params) {
    if (document.getElementById('2show_iframe_inside') != null) {
        var params = show2_prepare_params(partner_id, wg_params);
        document.getElementById("2show_iframe_inside").src = show2_domain + "/picker/widget?" + params + "&amp;use_method=inside";
    }
    return false
}

function show2_prepare_params(partner_id, wg_params) {
    params = "partner_site=" + encodeURIComponent(document.location.protocol + '//' + document.location.host);
    params += "&amp;partner_id=" + encodeURIComponent(partner_id);
    for (var i = 0; i < wg_params.length; i++) {
        key = wg_params[i];
        params += "&amp;" + key[0] + "=" + encodeURIComponent(key[1]);
    }
    return params
}

function show2_hide() {    
    var container = document.getElementById('2show_container');
    if (container != null) {
        container.parentNode.removeChild(container);
    }
    document.body.style.overflow = show2_body_overflow_backup;
    document.body.scroll = "";
    document.body.style.position = show2_body_position_backup;
    if (typeof(document.html) !== 'undefined') {
        document.html.style.overflow = show2_html_overflow_backup;
        document.html.scroll = "";        
    }
    return false;
}

function show2_hide_loading() {    
    document.getElementById("2show_iframe").style.display = 'block';
    //document.getElementById('2show_iframe_loading').style.display = 'none';
    document.getElementById("2show_iframe").setAttribute("onload", "");

}
