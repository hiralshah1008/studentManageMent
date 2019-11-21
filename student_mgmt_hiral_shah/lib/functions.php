<?php
/****************************************/
//FILE FOR DEFINING GENERAL FUNCTIONS
/****************************************/

/**
 * @version 1.0
 * @created 10/03/2005
 */



/*****************************************/

function _print($param)
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
function _printx($param)
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


?>
