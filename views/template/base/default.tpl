<!doctype html>
<html lang="ru">
<head>
    <?php include(TEMPLATE.'/layouts/head.tpl');?>
</head>
<body>
<header>
    <?php include(TEMPLATE.'/layouts/header.tpl');?>
</header>
<article>
    <?php include($_content);?>
</article>
<footer>
    <?php include(TEMPLATE.'/layouts/footer.tpl');?>
</footer>
</body>
<?php include(TEMPLATE.'/layouts/scripts.tpl');?>
<?=$_added_scripts;?>
</html>