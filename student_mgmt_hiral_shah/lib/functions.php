<?php
/****************************************/
//FILE FOR DEFINING GENERAL FUNCTIONS
/****************************************/

/**
 * @version 1.0
 * @created 10/03/2005
 */


function getarray($start,$end)
{
	if($start <= $end)
	{
		for ( $x = $start; $x <= $end; $x++ )
		{
			$values[$x] = str_pad($x, 2, "0", STR_PAD_LEFT);  
		}
	}
	else
	{
		for ( $x = $start; $x >= $end; $x-- )
		{
			$values[$x] = $x;
		}
	}
	return $values;
}

function getMonths($digit='')
{
	if (!empty($digit)) 
	{
		for ( $x = 1; $x < 13; $x++ )
		{
			if ($x<10) 
			{
				$x = "0".$x;
			}
			$values[$x] = $x;
		}
	}
	else
	{
		for ( $x = 1; $x < 13; $x++ )
		{
			$values[$x] = date( "m", mktime ( 0,0,0,$x,1,0 ) );
		}
	}	
	return $values;
}


function getMonth($maxLimit)
{
	$cnt=0;
	for($i=1;$i<=$maxLimit;$i++)
	{
		$arr[$cnt]=$i;
		$cnt++;
	}
	return $arr;
}

/*****************************************/

function _d($param)
{
	echo"<pre>";
	print_r($param);
	echo"</pre>";

}
function _df($param)
{
	if($_SERVER['REMOTE_ADDR'] == '203.88.143.250'){
		echo"<pre>";
		print_r($param);
		echo"</pre>";
	}

}
function _dx($param)
{
	echo"<pre>";
	print_r($param);
	echo"</pre>";
	exit;
}


/**
 * Function for redirect.
 *
 * Function redirect browser to another URL and exit current flow.
 *
 * @param string $url redirect to this URL.
 */
function redirect($url) 
{
    header("Location: $url");
    exit();
}


function htmlspecialchars_array($arr = array()) 
{
	$pattern = array("/\)/","/\(/",
					"/&amp;/","/&lt;/",
					"/&gt;/");
	$replacement = array("&#x29;","&#x28;",
						 "&","<",
						 ">","","");
	
	$pattern_key = array("/<script>/","/<\/script>/");
	$replacement_key = array("","");

	$rs =  array();
	while(list($key,$val) = each($arr)) 
	{
		if(is_array($val)) 
		{
			$rs[$key] = htmlspecialchars_array($val);
		}
		else 
		{
			$val = preg_replace( "/<iframe(.*)<\/iframe/i", "",$val );
			$val = preg_replace( "/<iframe/i", "",$val );
			$val = preg_replace( "/<\/iframe/i", "",$val );
			$val = preg_replace( "/<script(.*)<\/script/i", "",$val );
			$val = preg_replace( "/<script/i", "",$val );
			$val = preg_replace( "/<\/script/i", "",$val );
			$key = preg_replace($pattern_key,$replacement_key,htmlspecialchars(stripslashes($key)));
			$rs[$key] = preg_replace($pattern,$replacement,htmlspecialchars(stripslashes($val))); ;
		} 
	}
if(isset($_REQUEST['test']) && $_REQUEST['test'] =='on'){
_d($rs);
}
	return $rs;
}

function EncodeURL($url)
{
	$pattern = array("/ /","/ - /","/'/","/\"/","/#/","/__/","/&/","/\//","/\(/","/\)/","/--/","/-Â®/","/-â„¢/","/â„¢/");
	$replacement = array("-","-","","","","-","and","-","-","","-","","","");
	
	$url =  preg_replace($pattern,$replacement,strtolower(trim($url)));
	return $url;
}

function getmicrotime()
{ 
	list($usec, $sec) = explode(" ",microtime()); 
	return ((float)$usec + (float)$sec); 
} 


function array_csort() {  
   $i	=	0;
   $args = func_get_args();
   $marray = array_shift($args);
   $msortline = "return(array_multisort(";
   foreach ($args as $arg) {
	   $i++;
	   if (is_string($arg)) {
		   foreach ($marray as $row) {
			   $sortarr[$i][] = $row[$arg];
		   }
	   } else {
		   $sortarr[$i] = $arg;
	   }
	   $msortline .= "\$sortarr[".$i."],";
   }
   $msortline .= "\$marray));";
   @eval($msortline);
   return $marray;
}

function gzdecode12($data) {
 
  $len = strlen($data); 
  if ($len < 18 || strcmp(substr($data,0,2),"\x1f\x8b")) { 
    return null;  // Not GZIP format (See RFC 1952) 
  } 
  $method = ord(substr($data,2,1));  // Compression method 
  $flags  = ord(substr($data,3,1));  // Flags 
  if ($flags & 31 != $flags) { 
    // Reserved bits are set -- NOT ALLOWED by RFC 1952 
    return null; 
  } 
  // NOTE: $mtime may be negative (PHP integer limitations) 
  $mtime = unpack("V", substr($data,4,4)); 
  $mtime = $mtime[1]; 
  $xfl   = substr($data,8,1); 
  $os    = substr($data,8,1); 
  $headerlen = 10; 
  $extralen  = 0; 
  $extra     = ""; 
  if ($flags & 4) { 
    // 2-byte length prefixed EXTRA data in header 
    if ($len - $headerlen - 2 < 8) { 
      return false;    // Invalid format 
    } 
    $extralen = unpack("v",substr($data,8,2)); 
    $extralen = $extralen[1]; 
    if ($len - $headerlen - 2 - $extralen < 8) { 
      return false;    // Invalid format 
    } 
    $extra = substr($data,10,$extralen); 
    $headerlen += 2 + $extralen; 
  } 

  $filenamelen = 0; 
  $filename = ""; 
  if ($flags & 8) { 
    // C-style string file NAME data in header 
    if ($len - $headerlen - 1 < 8) { 
      return false;    // Invalid format 
    } 
    $filenamelen = strpos(substr($data,8+$extralen),chr(0)); 
    if ($filenamelen === false || $len - $headerlen - $filenamelen - 1 < 8) { 
      return false;    // Invalid format 
    } 
    $filename = substr($data,$headerlen,$filenamelen); 
    $headerlen += $filenamelen + 1; 
  } 

  $commentlen = 0; 
  $comment = ""; 
  if ($flags & 16) { 
    // C-style string COMMENT data in header 
    if ($len - $headerlen - 1 < 8) { 
      return false;    // Invalid format 
    } 
    $commentlen = strpos(substr($data,8+$extralen+$filenamelen),chr(0)); 
    if ($commentlen === false || $len - $headerlen - $commentlen - 1 < 8) { 
      return false;    // Invalid header format 
    } 
    $comment = substr($data,$headerlen,$commentlen); 
    $headerlen += $commentlen + 1; 
  } 

  $headercrc = ""; 
  if ($flags & 1) { 
    // 2-bytes (lowest order) of CRC32 on header present 
    if ($len - $headerlen - 2 < 8) { 
      return false;    // Invalid format 
    } 
    $calccrc = crc32(substr($data,0,$headerlen)) & 0xffff; 
    $headercrc = unpack("v", substr($data,$headerlen,2)); 
    $headercrc = $headercrc[1]; 
    if ($headercrc != $calccrc) { 
      return false;    // Bad header CRC 
    } 
    $headerlen += 2; 
  } 

  // GZIP FOOTER - These be negative due to PHP's limitations 
  $datacrc = unpack("V",substr($data,-8,4)); 
  $datacrc = $datacrc[1]; 
  $isize = unpack("V",substr($data,-4)); 
  $isize = $isize[1]; 

  // Perform the decompression: 
  $bodylen = $len-$headerlen-8; 
  if ($bodylen < 1) { 
    // This should never happen - IMPLEMENTATION BUG! 
    return null; 
  } 
  $body = substr($data,$headerlen,$bodylen); 
  $data = ""; 
  if ($bodylen > 0) { 
    switch ($method) { 
      case 8: 
        // Currently the only supported compression method: 
        $data = gzinflate($body); 
        break; 
      default: 
        // Unknown compression method 
        return false; 
    } 
  } else { 
    // I'm not sure if zero-byte body content is allowed. 
    // Allow it for now...  Do nothing... 
  } 

  // Verifiy decompressed size and CRC32: 
  // NOTE: This may fail with large data sizes depending on how 
  //       PHP's integer limitations affect strlen() since $isize 
  //       may be negative for large sizes. 
  if ($isize != strlen($data) || crc32($data) != $datacrc) { 
    // Bad format!  Length or CRC doesn't match! 
    return false; 
  } 
  return $data; 
}
?>