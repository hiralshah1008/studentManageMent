{config_load file="test.conf" section="setup"}
{include file="common_header.tpl" title=Dashboard}
<div class="grid-12">
	<div class="widget">
		<div class="widget-body">
		 <table class="datatable tables table-bordered">
		 {if $smarty.session.role eq 'S'}
			<thead>
			  <tr>
				<th><input name="cb_" type="checkbox" class="uniform"></th>
				<th>Title</th>
				<th>Assigned Date</th>
				<th>Last Submitted Date</th>
				<th>Action</th>
			  </tr>
			</thead>
			<tbody>
			{foreach from=$assigned_topic key=k item=topic}						
				<tr>
					<td><input name="cb_{$topic.id}" type="checkbox" class="uniform"></td>
					<td>{$topic.title}</td>
					<td>{$topic.date_added|date_format:'%d - %m - %Y'}</td>
					<td>{if $topic.date_submitted neq ''}{$topic.date_submitted|date_format:'%d - %m - %Y'}{else} - {/if}</td>					
					<td>
					<a href="submittopic.php?tid={$topic.id}&mode=edit{if $topic.hid neq ''}&hid={$topic.hid}{/if}"><div title="Edit" class="tipsy-s btn btn-o-icon btn-small btn-info"><i>&#xf044;</i></div></a>
					
					</td>
				</tr>
			{/foreach}
			</tbody>
			{elseif $smarty.session.role eq 'A'}
				<thead>
			  <tr>
				<th><input name="cb_" type="checkbox" class="uniform"></th>
				<th>Name</th>
				<th>Title</th>
				<th>Grade</th>
				<th>Roll Number</th>						
				<th>Submitted Date</th>
				<th>Status</th>
				<th>Action</th>
			  </tr>
			</thead>
			<tbody>
			{foreach from=$submitted_topics key=k item=topic}						
				<tr>
					<td><input name="cb_{$topic.id}" type="checkbox" class="uniform"></td>
					<td>{if $topic.gender eq 'M'}Mr. {else if $topic.gender eq 'F'}Miss. {/if}{$topic.first_name} {$topic.last_name}</td>
					<td>{$topic.title}</td>
					<td>Grade {$topic.grade}</td>
					<td>{$topic.rno}</td>
					<td>{if $topic.date_submitted neq ''}{$topic.date_submitted|date_format:'%d - %m - %Y'}{else} - {/if}</td>
					<td>{if $topic.h_status eq 'A'}Approved ({$topic.date_review|date_format:'%d - %m - %Y'}){elseif $topic.h_status eq 'R'}Reassigned{else}Not Reviewed{/if}</td>
					<td>
					<a href="submittopic.php?tid={$topic.tid}&mode=edit{if $topic.hid neq ''}&hid={$topic.hid}{/if}">
					<div title="Edit" class="tipsy-s btn btn-o-icon btn-small btn-info"><i>&#xf044;</i></div></a>
					</td>
				</tr>
			{/foreach}
			</tbody>
			{/if}
		</table>
		</div>
	</div>
</div>
{include file="common_footer.tpl"}
