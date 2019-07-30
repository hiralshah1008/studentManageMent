{config_load file="test.conf" section="setup"}
{include file="common_header.tpl"}
<style>
div.verticlespace {
    margin-bottom: 10px;
}
ul.tab_des	{
	background-color:#E9E9E9;color:#3D3D3D
}
</style>
<!-- Title & Sitemap -->
        <div class="title-sitemap grid-12">
          <h1 class="grid-6"><i>&#xf132;</i>Students<span>List Students</span></h1>
        </div>
      </header>
      <!-- Data -->
<div class="data grid-12">
<form name="addemp" method="post">
 <!-- Data table -->
        <div class="grid-12">
			<div class="widget">
				<div class="widget-body">
				 <table class="datatable tables table-bordered">
					<thead>
					  <tr>
						<th><input name="cb_" type="checkbox" class="uniform"></th>
						<th>Name</th>
						<th>Grade</th>
						<th>Roll Number</th>
						<th>Status</th>
						<th>Action</th>
					  </tr>
					</thead>
					<tbody>
					{foreach from=$students key=k item=student}						
						<tr>
							<td><input name="cb_{$student.id}" type="checkbox" class="uniform"></td>
							<td>{if $student.gender eq 'M'}Mr. {else if $student.gender eq 'F'}Miss. {/if}{$student.first_name} {$student.last_name}</td>
							<td>{$student.grade}</td>
							<td>{$student.rno}</td>
							<td>{if $student.status eq 'Y'}Active{else}Inactive{/if}</td>
							<td>
							<a href="student.php?id={$student.id}&mode=edit"><div title="Edit" class="tipsy-s btn btn-o-icon btn-small btn-info"><i>&#xf044;</i></div></a>
							<a onclick="return confirmbox();" href="liststudent.php?id={$student.id}&mode=del"><div title="Delete" class="tipsy-s btn btn-error btn-o-icon btn-small"><i>&#xf014;</i></div></a>
							</td>
						</tr>
					{/foreach}
					</tbody>
				</table>
				</div>
			</div>
		</div>
</form>
{include file="common_footer.tpl"}
<script>$(document).ready(function(){	
	$("input[name='cb_']").click(function(){
	
	if($(this).is(':checked')){
	$.each($("input[name^='cb_']"), function( index, value ) {	
	$(this).prop( "checked", true );
	$(this).closest('div').addClass('focus');
	$(this).closest('span').addClass('checked');
	});
	}else{
	$(this).prop("checked", false);;
	$.each($("input[name^='cb_']"), function( index, value ) {	
	$(this).prop("checked",false);
	$(this).closest('div').removeClass('focus');
	$(this).closest('span').removeClass('checked');
	});
	}
	});
	});
function confirmbox(){
return confirm("Are you sure?");
}

</script>