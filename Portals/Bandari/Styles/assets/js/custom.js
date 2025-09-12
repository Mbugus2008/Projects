/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
      $(".b_div").hide();
	  $("#buttons").hide();
	  $("#prev").hide();
   });
   
   
   
   function displayNext(){
       //Displays next
       $(document).ready(function() {
      $(".b_div").show();
      $(".t_div").hide();
      $("#next").hide();
	  $("#buttons").show();
          $("#prev").show();
	  
   });
   }
   
   
   function displayPrevious(){
       // displays previous
	 $(document).ready(function() {
      $(".b_div").hide();
      $(".t_div").show();
	  $("#prev").hide();
          $("#next").show();
          $("#buttons").hide();
	  
   }); 
   
       
   }