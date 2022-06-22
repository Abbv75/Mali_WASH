<?php
   function test(){
    return array("hgg","igdfff"); 

   }
   echo(sizeof($_GET));
   echo(array_search($_GET,test()));
   echo("uh");
   echo($_GET["habit1"]);
?>