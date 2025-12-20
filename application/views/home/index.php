

<div class="col-md-12">
    <h3 class="page-header"><i class="fa fa-th-large"></i> مساحات العمل (Boards)</h3>
    
    <div class="row">
        <?php foreach ($boards as $board): ?>
            <div class="col-sm-6">
                <a href="<?= $board->url; ?>" class="board-card-link">
                    <div class="board-card">
                        <div class="board-card-body">
                            <h4 class="board-title"><?php echo $board->name; ?></h4>
                            <p class="board-desc text-muted">
                                <?php echo (strlen($board->description) > 60) ? substr($board->description, 0, 60) . '...' : $board->description; ?>
                            </p>
                        </div>
                        <div class="board-card-footer">
                            <span class="label label-default">
                                <i class="fa fa-lightbulb-o"></i>جديد
                            </span>
                            <i class="fa fa-arrow-left pull-left view-icon"></i>
                        </div>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</div>