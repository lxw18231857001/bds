<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:73:"D:\phpStudy\PHPTutorial\WWW\bds\php/application/home\view\news\index.html";i:1515400336;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>news 分页</title>
</head>
<body>
<div>分页</div>
<?php echo $front; ?>&nbsp;&nbsp;&nbsp;--<?php echo $after; ?><br>
<a href="<?php echo $f_url; ?>">上一页</a> &nbsp;&nbsp;&nbsp; <a href="<?php echo $a_url; ?>">下一页</a>
</body>
</html>