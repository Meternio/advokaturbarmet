<?php
$alignment = 'REX_VALUE[1]';
$text = 'REX_VALUE[id=2 output=html]';
$links = rex_var::toArray('REX_VALUE[3]');

$output = '<div class="image__text component '.$alignment.'">';

    $output .= '<div class="col">';
        $output .= Simplify::getPictureTag('REX_MEDIA[1]');
    $output .= '</div>';

    // Links
    $alignClass = 'REX_VALUE[5]' === 'label' ? ' no-center' : '';
    $output .= '<div class="col'.$alignClass.'">';
        $output .= '<div class="text paragraph">';
        $output .= $text;
        if(!empty($links)) {
            $output .= '<div class="links">';
            foreach($links as $link) {
                $anchorAttribute = !empty($link['anchor']) ? ' data-anchor="#'.$link['anchor'].'"' : '';
                $isExternal = !empty($link['external']);
                $linkText = $link['linkText'];

                if($isExternal) {
                    $output .= '<a href="'.Simplify::formatLink($link['external']).'" data-cursor-dynamic rel="noreferrer" target="_blank">'.$linkText.'</a>';
                } else {
                    $output .= !empty($link['REX_LINK_3']) ? '<a href="'.rex_article::get($link['REX_LINK_3'], rex_clang::getCurrentId())->getUrl().'" data-cursor-dynamic>'.$linkText.'</a>' : '';
                }
            }
            $output .= '</div>';
        }
        $output .= '</div>';
    $output .= '</div>';

$output .= '</div>';
echo $output;

?>