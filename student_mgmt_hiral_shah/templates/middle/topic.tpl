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
          <h1 class="grid-6"><i>&#xf132;</i>Topic<span>{if $smarty.get.mode eq 'edit'}Edit{else}Add{/if} Topic</span></h1>
        </div>
      </header>
      <!-- Data -->
      <div class="data grid-12">
<form name="topic" method="post" enctype="multipart/form-data">
 <div class="tab-content">
	<div id="tabs-pd" class="tab-pane fade in active">
		<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Title* :</h5></span>
		</div>
		<div class="grid-10">
			<input type="text" id="title" name="title" class="form form-big required" value="{$clsTopic->title}">
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Description* :</h5></span>
		</div>
		<div class="grid-10">
			<textarea type="text" name="description" class="form form-big">{$clsTopic->description}</textarea>
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Grade:</h5></span>
		</div>
		<div class="grid-10">
			<select class="form" name="grade">
				<option value="1" {if $clsTopic->grade eq 1}selected{/if}>Grade 1</option>
				<option value="2" {if $clsTopic->grade eq 2}selected{/if}>Grade 2</option>
				<option value="3" {if $clsTopic->grade eq 3}selected{/if}>Grade 3</option>
				<option value="4" {if $clsTopic->grade eq 4}selected{/if}>Grade 4</option>
				<option value="5" {if $clsTopic->grade eq 5}selected{/if}>Grade 5</option>
			</select>
		</div>
	</div>
	
	<div class="grid-12 verticlespace">
		<div class="grid-2">
			<span><h5 class="typo">Status:</h5></span>
		</div>
		<div class="grid-10">
			<select class="form" name="status">
			<option value="Y" {if $clsTopic->status eq 'Y'}selected{/if}>Active</option>
			<option value="N" {if $clsTopic->status eq 'N'}selected{/if}>Inactive</option>
			</select>
		</div>
	</div>
	<div class="grid-12 verticlespace">
		<input type="submit" name="submit" value="Save" class="btn btn-submit btn-rounded" style="align:center">
	</div>
	</div>			
</div>
	
</form>
{include file="common_footer.tpl"}