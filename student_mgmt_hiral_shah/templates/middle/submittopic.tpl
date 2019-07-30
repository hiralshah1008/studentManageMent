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
          <h1 class="grid-6"><i>&#xf132;</i>Homework<span>{if $smarty.session.role eq 'S'}Submit{else}Review{/if} Homework</span></h1>
        </div>
      </header>
      <!-- Data -->
      <div class="data grid-12">
		<form name="student" method="post" enctype="multipart/form-data">
		 <div class="tab-content">
			<div id="tabs-pd" class="tab-pane fade in active">
				<!--{*<div class="grid-12 verticlespace">
				<div class="grid-2">
					<span><h5 class="typo">Topic Title:</h5></span>
				</div>
				<div class="grid-10">
					<input type="text" id="title" name="title" class="form form-big required" value="{$clsStudent->title}" readonly>
				</div>*}-->
				<h3 class="typo">{$clsStudent->title}</h3>
				<pre class="typo">{$clsStudent->description}</pre>
			</div>
			<!--{*<div class="grid-12 verticlespace">
				<div class="grid-2">
					<span><h5 class="typo">Description:</h5></span>
				</div>
				<div class="grid-10">
					<textarea type="text" name="description" class="form form-big" readonly>{$clsStudent->description}</textarea>
				</div>
			</div>*}-->
			<div class="grid-12 verticlespace">
				<div class="grid-2">
					<span><h5 class="typo">Answer:</h5></span>
				</div>
				<div class="grid-10">
					<textarea type="text" name="answer" class="form form-big">{$clsStudent->answer}</textarea>
				</div>
			</div>
			<div class="grid-12 verticlespace">
				<div class="grid-2">
					<span><h5 class="typo">Reviewer Comment:</h5></span>
				</div>
				<div class="grid-10">
					<textarea type="text" name="comment" class="form form-big" {if $smarty.session.role eq 'S'} disabled{/if}>{$clsStudent->comment}</textarea>
				</div>
			</div>
			{if $clsStudent->date_submitted neq ''}
			<div class="grid-12 verticlespace">
				<div class="grid-2">
					<span><h5 class="typo">Homework Satus:</h5></span>
				</div>
				<div class="grid-10">
					<select class="form" name="h_status"  {if $smarty.session.role eq 'S'} disabled{/if}>
						<option value="">Under Review</option>						
						<option value="A" {if $clsStudent->h_status eq 'A'}selected{/if}>Approved</option>
						<option value="R" {if $clsStudent->h_status eq 'R'}selected{/if}>Reassign</option>
					</select>
				</div>
			</div>	
			{/if}			
			{if $showSubmitButton}
			<div class="grid-12 verticlespace">
				<input type="submit" name="submit" value="Save" class="btn btn-submit btn-rounded" style="align:center">
			</div>
			{/if}
			</div>			
		</div>
			
		</form>
{include file="common_footer.tpl"}
<script>
</script>