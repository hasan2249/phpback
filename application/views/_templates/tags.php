	<div class="col-md-2">
		<div class="sidemenu">
			<div id="tags">
				<h6><?php echo $lang['label_tags']; ?></h6>
				<ul class="nav nav-pills nav-stacked">
				 <?php foreach($all_tags as $tag) { ?>
					<li <?php if(!$tag->total_ideas) echo 'class="disabled"';?>><a href="<?php echo $tag->url; ?>"><?php echo $tag->name; ?><span class="badge"><?php echo $tag->total_ideas; ?></span></a></li>
				 <?php } ?>
				</ul>
				<br>
			</div>
		</div>
	</div>
