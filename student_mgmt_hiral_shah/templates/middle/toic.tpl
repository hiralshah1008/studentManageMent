{config_load file="test.conf" section="setup"}
{include file="common_header.tpl" }
<!-- tab form -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
div.verticlespace {
    margin-bottom: 10px;
}
.container {
    width: 100%;
}
a:hover{
    text-decoration: none;
}
</style>
<!-- Title & Sitemap -->
        <div class="title-sitemap grid-12">
          <h1 class="grid-6"><i>&#xf132;</i>Student<span>{if $smarty.get.mode eq 'edit'}Edit{else}Add{/if} Student</span></h1>
        </div>
      </header>
      <!-- Data -->
      <div class="data grid-12">
<form name="student" method="post" enctype="multipart/form-data">
 <div class="tab-content">
	<div id="tabs-pd" class="tab-pane fade in active">
		<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">First Name:</h5></span>
		</div>
		<div class="grid-10">
			<input type="text" id="first_name" name="first_name" class="form form-big required" value="{$clsStudent->first_name}">
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Last Name:</h5></span>
		</div>
		<div class="grid-10">
			<input type="text" id="last_name" name="last_name" class="form form-big required" value="{$clsStudent->last_name}">
		</div>
	</div>		
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Roll Number:</h5></span>
		</div>
		<div class="grid-10">
			<input type="text" id="rno" name="rno" class="form form-big" value="{$clsStudent->rno}">
			<span id="valid_rno"></span>
		</div>
	</div>	
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">User Name:</h5></span>
		</div>
		<div class="grid-10">
			<input type="text" id="uname" name="uname" class="form form-big" value="{$clsStudent->uname}" {if $smart.get.mode eq 'edit'}disabled{else}readonly{/if}>
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Gender:</h5></span>
		</div>
		<div class="grid-10">
			<label><input type="radio" name="gender" value="M" class="uniform" {if $clsStudent->gender eq 'M'} checked="checked"{/if}><h5 class="typo inline">Male</h5></label>
			<label><input type="radio" name="gender" value="F" class="uniform" {if $clsStudent->gender eq 'F'} checked="checked"{/if}><h5 class="typo inline">Female</h5></label>
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Password:</h5></span>
		</div>
		<div class="grid-10">
			<input type="password" name="password" class="form form-big">
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Email:</h5></span>
		</div>
		<div class="grid-10">
			<input type="text" name="email" class="form form-big required" ang-options="email:true" value="{$clsStudent->email}">
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Grade:</h5></span>
		</div>
		<div class="grid-10">
			<select class="form" name="grade">
				<option value="1" {if $clsStudent->grade eq 1}selected{/if}>Grade 1</option>
				<option value="2" {if $clsStudent->grade eq 2}selected{/if}>Grade 2</option>
				<option value="3" {if $clsStudent->grade eq 3}selected{/if}>Grade 3</option>
				<option value="4" {if $clsStudent->grade eq 4}selected{/if}>Grade 4</option>
				<option value="5" {if $clsStudent->grade eq 5}selected{/if}>Grade 5</option>
			</select>
		</div>
	</div>
	
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Address:</h5></span>
		</div>
		<div class="grid-10">
			<textarea type="text" name="address" class="form form-big">{$clsStudent->address}</textarea>
		</div>
	</div>
	
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Status:</h5></span>
		</div>
		<div class="grid-10">
			<select class="form" name="status">
			<option value="Y" {if $clsStudent->status eq 'Y'}selected{/if}>Active</option>
			<option value="N" {if $clsStudent->status eq 'N'}selected{/if}>Inactive</option>
			</select>
		</div>
	</div>	
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Profile photo:</h5></span>
		</div>
		<div class="grid-10">
			<input type="file" name="profilephoto" id="profilephoto">
			<input type="hidden" name="profilephoto" value="{$clsStudent->profilephoto}">
			{if $smarty.get.mode eq 'edit'}
			<br/>
			<img src="images/{$clsStudent->profilephoto}" height="100px" width="100px">
			{/if}
			
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<input type="submit" name="submit" value="Save" class="btn btn-submit btn-rounded" style="align:center">
	</div>
	</div>			
</div>
	
</form>
{include file="common_footer.tpl"}
<script>
$(document).ready(function(){
	$('#uname').focus(function(){
		
	});
	$('#rno').blur(function(){
		var rno = $('#rno').val();
		$.ajax({
		url : "student.php?action=checkrno&rno="+rno,
		beforeSend: function( xhr ) {
			$('#valid_rno').html('<img src="images/ajax-loader.gif">');
		}
		}).done(function(res){
		if(res >= 1){
			//$('#rno').append('<span id="valid_rno"');
			$('#valid_rno').html('This roll numer already exist');
			}else{
			var fname = $('#first_name').val();
			var lname = $('#last_name').val().replace(" ","_"); 
			var rno = $('#rno').val();
			var uname = fname.charAt(0)+""+lname+rno;
			$('#uname').val(uname.toLowerCase());
			$('#valid_rno').html('');
			
		}
		})
	});
});
</script>