<?php
$images = ['REX_MEDIA[1]','REX_MEDIA[2]','REX_MEDIA[3]','REX_MEDIA[4]'];
$url = !empty('REX_LINK[1]') ? rex_article::get('REX_LINK[1]', rex_clang::getCurrentId())->getUrl() : '';
$title = !empty('REX_LINK[1]') ? rex_article::get('REX_LINK[1]', rex_clang::getCurrentId())->getName() : '';

$output = !empty($url) ? '<a href="'.$url.'" title="'.$title.'" class="component thumb__link">' : '';
$output .= '<div class="thumbnail__row" data-cursor-dynamic>';
foreach($images as $image) {
    $output .= '<div class="thumbnail">';

        $output .= Simplify::getPictureTag($image);
        //$output .= media_manager_plus_frontend::generatePictureTag($imgObj->getExtension(), $imgObj->getFileName());
    $output .= '</div>';
}
$output .= '</div>';
$output .= !empty($url) ? '</a>' : '';
echo $output;
?>