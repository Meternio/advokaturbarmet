<?php
$isBackToTop = !empty('REX_VALUE[3]') ? ' scroll__to--top' : '';
$notSloping = !empty('REX_VALUE[4]') ? ' padding' : '';
$anchor = !empty('REX_VALUE[2]') ? ' id="#' . 'REX_VALUE[2]' . '"' : '';
$cursor = !empty($isBackToTop) ? ' data-cursor-dynamic' : '';
$output = '<h2 class="subtitle component' . $isBackToTop . $notSloping . '"' . $anchor . $cursor . '>REX_VALUE[1]</h2>';
echo $output;
?>