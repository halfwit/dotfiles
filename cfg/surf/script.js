/* Let's watch global mode, set visual selections for input mode and such
 * and from there try to get a full modal browser simply with Javascript
 * so that DOM access isn't horrible
 */

var hint_num_str = '';
var hint_elems = [];
var hint_open_in_new_tab = false;
var hint_enabled = false;

/*function selectElementText(el, win) {
    win = win || window;
    var doc = win.document, sel, range;
    if (win.getSelection && doc.createRange) {
        sel = win.getSelection();
        range = doc.createRange();
        range.selectNodeContents(el);
        sel.removeAllRanges();
        sel.addRange(range);
    } else if (doc.body.createTextRange) {
        range = doc.body.createTextRange();
        range.moveToElementText(el);
        range.select();
    }
}

selectElementText(document.getElementById("someElement"));
selectElementText(elementInIframe, iframe.contentWindow);
*/

function up() {
  window.scrollBy(0, -12);
}

function down() {
  window.scrollBy(0, 12);
}

function pageup() {
  window.scrollBy(0, 0 - _pageScroll());
}

function pagedown() {
  window.scrollBy(0, _pageScroll());
}

function right() {
  window.scrollBy(15, 0);
}

function left() {
  window.scrollBy(-15, 0);
}

function home() {
  window.scroll(0, 0);
}

function bottom() {
  window.scroll(document.width, document.height);
}

var bindings = {
    'h' : left, 
    'l' : right,
    'k' : up,
    'j' : down,
    'g' : home,
    'G' : bottom,
    '^u': pageup,
    '^d': pagedown,
}

function isEditable(element) {
    
    if (element.nodeName.toLowerCase() == "textarea")
        return true;

    // we don't get keypress events for text input, but I don't known
    // if it's a bug, so let's test that
    if (element.nodeName.toLowerCase() == "input" && element.type == "text")
        return true;

    // element is editable
    if (document.designMode == "on" || element.contentEditable == "true") {
        return true;
    }
    
    return false;
}

function keypress(evt) {
    var target = evt.target;
            
    // if we're on a editable element, we probably don't want to catch
    // keypress, we just want to write the typed character.
    if (isEditable(target))
        return;

    var key = String.fromCharCode(evt.charCode);
    if (evt.ctrlKey) {
        key = '^' + key;
    }

    var fun = bindings[key];
    if (fun)
        fun();

}

function _pageScroll() {
    return window.innerHeight - Math.min(window.innerHeight / 10, 24);
}

window.addEventListener("keypress", keypress, false);

/*
function hintMode(newtab){
    hint_enabled = true;
    if (newtab) {
        hint_open_in_new_tab = true;
    } else {
        hint_open_in_new_tab = false;
    }
    setHints();
    document.removeEventListener('keydown', initKeyBind, false);
    document.addEventListener('keydown', hintHandler, false);
    hint_num_str = '';
}

function hintHandler(e){
    e.preventDefault();  //Stop Default Event 
    var pressedKey = get_key(e);
    if (pressedKey == 'Enter') {
        if (hint_num_str == '')
            hint_num_str = '1';
        judgeHintNum(Number(hint_num_str));
    } else if (/[0-9]/.test(pressedKey) == false) {
        removeHints();
    } else {
        hint_num_str += pressedKey;
        var hint_num = Number(hint_num_str);
        if (hint_num * 10 > hint_elems.length + 1) {
            judgeHintNum(hint_num);
        } else {
            var hint_elem = hint_elems[hint_num - 1];
            if (hint_elem != undefined && hint_elem.tagName.toLowerCase() == 'a') {
                setHighlight(hint_elem, true);
            }
        }
    }
}

function setHighlight(elem, is_active) {
    if (is_active) {
        var active_elem = document.body.querySelector('a[highlight=hint_active]');
        if (active_elem != undefined)
            active_elem.setAttribute('highlight', 'hint_elem');
        elem.setAttribute('highlight', 'hint_active');
    } else {
        elem.setAttribute('highlight', 'hint_elem');
    }

}

function setHintRules() {
    var ss = document.styleSheets[0];
    ss.insertRule('a[highlight=hint_elem] {background-color: yellow}', 0);
    ss.insertRule('a[highlight=hint_active] {background-color: lime}', 0);
}

function deleteHintRules() {
    var ss = document.styleSheets[0];
    ss.deleteRule(0);
    ss.deleteRule(0);
}

function judgeHintNum(hint_num) {
    var hint_elem = hint_elems[hint_num - 1];
    if (hint_elem != undefined) {
        execSelect(hint_elem);
    } else {
        removeHints();
    }
}

function execSelect(elem) {
    var tag_name = elem.tagName.toLowerCase();
    var type = elem.type ? elem.type.toLowerCase() : "";
    if (tag_name == 'a' && elem.href != '') {
        setHighlight(elem, true);
        // TODO: ajax, <select>
        if (hint_open_in_new_tab)
            window.open(elem.href);
        else location.href=elem.href;

    } else if (tag_name == 'input' && (type == "submit" || type == "button" || type == "reset")) {
        elem.click();
    } else if (tag_name == 'input' && (type == "radio" || type == "checkbox")) {
        // TODO: toggle checkbox
        elem.checked = !elem.checked;
    } else if (tag_name == 'input' || tag_name == 'textarea') {
        elem.focus();
        elem.setSelectionRange(elem.value.length, elem.value.length);
    }
    removeHints();
}

function setHints() {
    setHintRules();
    var win_top = window.scrollY;
    var win_bottom = win_top + window.innerHeight;
    var win_left = window.scrollX;
    var win_right = win_left + window.innerWidth;
    // TODO: <area>
    var elems = document.body.querySelectorAll('a, input:not([type=hidden]), textarea, select, button');
    var div = document.createElement('div');
    div.setAttribute('highlight', 'hints');
    document.body.appendChild(div);
    for (var i = 0; i < elems.length; i++) {
        var elem = elems[i];
        if (!isHintDisplay(elem))
            continue;
        var pos = elem.getBoundingClientRect();
        var elem_top = win_top + pos.top;
        var elem_bottom = win_top + pos.bottom;
        var elem_left = win_left + pos.left;
        var elem_right = win_left + pos.left;
        if ( elem_bottom >= win_top && elem_top <= win_bottom) {
            hint_elems.push(elem);
            setHighlight(elem, false);
            var span = document.createElement('span');
            span.style.cssText = [ 
                'left: ', elem_left, 'px;',
                'top: ', elem_top, 'px;',
                'position: absolute;',
                'font-size: 13px;',
                'background-color: ' + (hint_open_in_new_tab ? '#ff6600' : 'red') + ';',
                'color: white;',
                'font-weight: bold;',
                'padding: 0px 1px;',
                'z-index: 100000;'
                    ].join('');
            span.innerHTML = hint_elems.length;
            div.appendChild(span);
            if (elem.tagName.toLowerCase() == 'a') {
                if (hint_elems.length == 1) {
                    setHighlight(elem, true);
                } else {
                    setHighlight(elem, false);
                }
            }
        }
    }
}

function isHintDisplay(elem) {
    var pos = elem.getBoundingClientRect();
    return (pos.height != 0 && pos.width != 0);
}

function removeHints() {
    if (!hint_enabled)
        return;
    hint_enabled = false;
    deleteHintRules();
    for (var i = 0; i < hint_elems.length; i++) {
        hint_elems[i].removeAttribute('highlight');
    }
    hint_elems = [];
    hint_num_str = '';
    var div = document.body.querySelector('div[highlight=hints]');
    if (div != undefined) {
        document.body.removeChild(div);
    }
    document.removeEventListener('keydown', hintHandler, false);
    document.addEventListener('keydown', initKeyBind, false);
}

function addKeyBind( key, func, eve ){
    var pressedKey = get_key(eve);
    if( pressedKey == key ){
        eve.preventDefault();  //Stop Default Event 
        eval(func);
    }
}

document.addEventListener( 'keydown', initKeyBind, false );

function initKeyBind(e){
    var t = e.target;
    if( t.nodeType == 1){
        addKeyBind( 'C-f', 'hintMode()', e );
        addKeyBind( 'C-F', 'hintMode(true)', e );
        addKeyBind( 'C-c', 'removeHints()', e );
    }
}

var keyId = {
    "U+0008" : "BackSpace",
    "U+0009" : "Tab",
    "U+0018" : "Cancel",
    "U+001B" : "Esc",
    "U+0020" : "Space",
    "U+0021" : "!",
    "U+0022" : "\"",
    "U+0023" : "#",
    "U+0024" : "$",
    "U+0026" : "&",
    "U+0027" : "'",
    "U+0028" : "(",
    "U+0029" : ")",
    "U+002A" : "*",
    "U+002B" : "+",
    "U+002C" : ",",
    "U+002D" : "-",
    "U+002E" : ".",
    "U+002F" : "/",
    "U+0030" : "0",
    "U+0031" : "1",
    "U+0032" : "2",
    "U+0033" : "3",
    "U+0034" : "4",
    "U+0035" : "5",
    "U+0036" : "6",
    "U+0037" : "7",
    "U+0038" : "8",
    "U+0039" : "9",
    "U+003A" : ":",
    "U+003B" : ";",
    "U+003C" : "<",
    "U+003D" : "=",
    "U+003E" : ">",
    "U+003F" : "?",
    "U+0040" : "@",
    "U+0041" : "a",
    "U+0042" : "b",
    "U+0043" : "c",
    "U+0044" : "d",
    "U+0045" : "e",
    "U+0046" : "f",
    "U+0047" : "g",
    "U+0048" : "h",
    "U+0049" : "i",
    "U+004A" : "j",
    "U+004B" : "k",
    "U+004C" : "l",
    "U+004D" : "m",
    "U+004E" : "n",
    "U+004F" : "o",
    "U+0050" : "p",
    "U+0051" : "q",
    "U+0052" : "r",
    "U+0053" : "s",
    "U+0054" : "t",
    "U+0055" : "u",
    "U+0056" : "v",
    "U+0057" : "w",
    "U+0058" : "x",
    "U+0059" : "y",
    "U+005A" : "z",
    //"U+005B" : "[",
    //"U+005C" : "\\",
    //"U+005D" : "]",
    "U+00DB" : "[",
    "U+00DC" : "\\",
    "U+00DD" : "]",
    "U+005E" : "^",
    "U+005F" : "_",
    "U+0060" : "`",
    "U+007B" : "{",
    "U+007C" : "|",
    "U+007D" : "}",
    "U+007F" : "Delete",
    "U+00A1" : "¡",
    "U+0300" : "CombGrave",
    "U+0300" : "CombAcute",
    "U+0302" : "CombCircum",
    "U+0303" : "CombTilde",
    "U+0304" : "CombMacron",
    "U+0306" : "CombBreve",
    "U+0307" : "CombDot",
    "U+0308" : "CombDiaer",
    "U+030A" : "CombRing",
    "U+030B" : "CombDblAcute",
    "U+030C" : "CombCaron",
    "U+0327" : "CombCedilla",
    "U+0328" : "CombOgonek",
    "U+0345" : "CombYpogeg",
    "U+20AC" : "€",
    "U+3099" : "CombVoice",
    "U+309A" : "CombSVoice",
}

function get_key(evt){
    var key = keyId[evt.keyIdentifier] || evt.keyIdentifier,
        ctrl = evt.ctrlKey ? 'C-' : '',
        meta = (evt.metaKey || evt.altKey) ? 'M-' : '',
        shift = evt.shiftKey ? 'S-' : '';
    if (evt.shiftKey){
        if (/^[a-z]$/.test(key)) 
            return ctrl+meta+key.toUpperCase();
        if (/^[0-9]$/.test(key)) {
            switch(key) {
                // TODO
                case "4":
                    key = "$";
                break;
            };
            return key;
        }
        if (/^(Enter|Space|BackSpace|Tab|Esc|Home|End|Left|Right|Up|Down|PageUp|PageDown|F(\d\d?))$/.test(key)) 
            return ctrl+meta+shift+key;
    }
    return ctrl+meta+key;
}
*/
/* See COPYING file for copyright, license and warranty details. */

(function() {
	document.addEventListener('keydown', keybind, false);
})();

function keybind(e) {
	if(e.altKey && String.fromCharCode(e.keyCode) == "R")
		simplyread();
}
/* See COPYING file for copyright, license and warranty details. */

if(window.content && window.content.document && window.content.document.simplyread_original === undefined) window.content.document.simplyread_original = false;

function simplyread(nostyle, nolinks)
{
	/* count the number of <p> tags that are direct children of parenttag */
	function count_p(parenttag)
	{
		var n = 0;
		var c = parenttag.childNodes;
		for (var i = 0; i < c.length; i++) {
			if (c[i].tagName == "p" || c[i].tagName == "P")
				n++;
		}
		return n;
	}
	
	var doc;
	doc = (document.body === undefined)
	      ? window.content.document : document;
	
	/* if simplyread_original is set, then the simplyread version is currently active,
	 * so switch to the simplyread_original html */
	if (doc.simplyread_original) {
		doc.body.innerHTML = doc.simplyread_original;
		for (var i = 0; i < doc.styleSheets.length; i++)
			doc.styleSheets[i].disabled = false;
		doc.simplyread_original = false
		return 0;
	}
	
	doc.simplyread_original = doc.body.innerHTML;
	doc.body.innerHTML = doc.body.innerHTML.replace(/<br[^>]*>\s*<br[^>]*>/g, "<p>");
	
	var biggest_num = 0;
	var biggest_tag;
	
	/* search for tag with most direct children <p> tags */
	var t = doc.getElementsByTagName("*");
	for (var i = 0; i < t.length; i++) {
		var p_num = count_p(t[i]);
		if (p_num > biggest_num) {
			biggest_num = p_num;
			biggest_tag = t[i];
		}
	}
	
	if (biggest_num == 0) return 1;
	
	/* save and sanitise content of chosen tag */
	var fresh = doc.createElement("div");
	fresh.innerHTML = biggest_tag.innerHTML;
	fresh.innerHTML = fresh.innerHTML.replace(/<\/?font[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/style="[^"]*"/g, "");
	if(nolinks)
		fresh.innerHTML = fresh.innerHTML.replace(/<\/?a[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/<\/?span[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/<style[^>]*>/g, "<style media=\"aural\">"); /* ensures contents of style tag are ignored */
	
	for (var i = 0; i < doc.styleSheets.length; i++)
		doc.styleSheets[i].disabled = true;
	
	srstyle =
		"p{margin:0ex auto;} h1,h2,h3,h4{font-weight:normal}" +
		"p+p{text-indent:2em;} body{background:#cccccc none}" +
		"img{display:block; max-width: 32em; padding:1em; margin: auto}" +
		"h1{text-align:center;text-transform:uppercase}" +
		"div#sr{width:34em; padding:8em; padding-top:2em;" +
		"  background-color:white; margin:auto; line-height:1.4;" +
		"  text-align:justify; font-family:serif; hyphens:auto;}";
		/* text-rendering:optimizeLegibility; - someday this will work,
		 *   but at present it just ruins justify, so is disabled */
	
	doc.body.innerHTML =
		"<style type=\"text/css\">" + (nostyle ? "" : srstyle) + "</style>" +
		"<div id=\"sr\">" + "<h1>"+doc.title+"</h1>" + fresh.innerHTML + "</div>";
	
	return 0;
}
