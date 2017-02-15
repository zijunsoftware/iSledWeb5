var startTime;

function doScan() {
	// Wait for Cordova to load
    document.addEventListener("deviceready", onDeviceReady, false);
}
			
// Cordova is ready
//
function onDeviceReady() {
	startTime = new Date();
	cordova.exec(onscanSuccess, onscanError, "Scan", "doScan", []);
}
			
// onSuccess: Get a snapshot of the current contacts
//
function onscanSuccess(message) {
	var endTime = new Date();
	var spendTime = endTime.getMilliseconds() - startTime.getMilliseconds();
	
	document.getElementById("result").innerHTML = message;
	document.getElementById("spend").innerHTML = spendTime;
}
// onError: Failed to get the contacts
//
function onscanError() {
	alert('onError!');
}

//------setting-------

function ondecoderdisable()
{
    document.addEventListener("decoderready",onDecoderReady,false) ;
}

function onDecoderReady()
{
    startTime = new Date ;
    cordova.exec(onscanSuccess,onscanError,"disable","disableDecoder",[]) ; 
}

function onSettingSuccess(message)
{
    
}

function onSettingError()
{
    alert('onError!');
}

function enableDecoder()
{
    
    document.addEventListener("Enable",onEnableDeocder,false) ;
}

function onEnableDeocder()
{
    cordova.exec(onSettingSuccess,onSettingError,"Enable","enableDeocder",[]);
}


function ondisableDecoder()
{
    document.addEventListener("disableDecoder",onDisableDecoder,false);
}

function onDisableDecoder()
{
    cordova.exec(onscanSuccess,onscanError,"Disable","disableDecoder",[]) ;
}



