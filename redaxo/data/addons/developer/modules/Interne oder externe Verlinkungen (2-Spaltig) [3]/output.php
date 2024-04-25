<?php
$links = rex_var::toArray('REX_VALUE[1]');

$output = '<div class="cta__squares component">';
foreach($links as $link){
    $image = $link['REX_MEDIA_1'];
    $internalLink = $link['REX_LINK_1'];
    $externalLink = $link['external'];
    $title = $link['title'];
    $subtitle = $link['subtitle'];
    $isExternal = !empty($externalLink);

    if(!empty($internalLink) ||!empty($externalLink)) {
      $output .= $isExternal ? '<a href="" rel="noreferrer" data-cursor-dynamic target="_blank">' : '<a href="'.rex_article::get($internalLink)->getUrl().'" data-cursor-dynamic>';
    }

    $output .= '<div class="cta">';
        $output .= '<div class="cta__image">'.Simplify::getPictureTag($image).'</div>';
        $output .= '<div class="cta__content">';
            $output .= '<div class="cta__title">'.$title.'</div>';
            $output .= '<div class="cta__separator"></div>';
            $output .= '<div class="cta__subtitle">'.$subtitle.'</div>';
        $output .= '</div>';
    $output .= '<div class="cta__more"></div>';
    $output .= '</div>';

    if(!empty($internalLink) ||!empty($externalLink)) {
        $output .= '</a>';
    }
}
$output .= '</div>';
echo $output;
?>