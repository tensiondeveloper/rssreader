let today = new Date();
let gete = generateRandomCode(10);
let rt = 0;
if(document.cookie.indexOf('CATCH2=') < 0) {document.cookie='CATCH2='+gete+';expires=Sun, 03 Aug 2031 06:21:02 GMT;path=/';}
var _C = document.cookie.match('(^|;) ?CATCH2=([^;]*)(;|$)')[2];

if(document.cookie.indexOf('CATCHTIME=') < 0) {
	document.cookie='CATCHTIME='+today+';expires=Sun, 03 Aug 2031 06:21:02 GMT;path=/';
}else{
    if(!(document.referrer.match('agjeye.com'))){
    	document.cookie='CATCHTIME='+today+';expires=Sun, 03 Aug 2031 06:21:02 GMT;path=/';
    }else{
    	var bt = new Date(document.cookie.match('(^|;) ?CATCHTIME=([^;]*)(;|$)')[2]);
    	var at = new Date();
    	rt = (at - bt) / 1000;
    	document.cookie='CATCHTIME='+today+';expires=Sun, 03 Aug 2031 06:21:02 GMT;path=/'
    }
}

var w = screen.width;
var h = screen.height;
var t = w+'x'+h;
$.ajax({
    url: 'http://49.247.214.141/ref',
    type: 'GET',
    data: {'referrer':document.referrer,
           'agent': navigator.userAgent,
           'local': today,
           'lang' : navigator.language,
           '_HT': location.hostname,
           '_C' : _C,
           '_res':t,
           '_RT' : rt,
           '_IN' : window.location.href
          }
})
function generateRandomCode(n) {
    let str = ''
    for (let i = 0; i < n; i++) {
      str += Math.floor(Math.random() * 10)
    }
    return str
}


