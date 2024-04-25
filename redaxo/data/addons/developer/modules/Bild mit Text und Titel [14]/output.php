<?php
$alignment = 'REX_VALUE[1]';
$text = 'REX_VALUE[id=4 output=html]';
$output = '<div class="image__text with--title component '.$alignment.'">';

$output .= '<div class="col">';
if(!empty('REX_MEDIA[1]')) {
    $output .= Simplify::getPictureTag('REX_MEDIA[1]');
}
$output .= '</div>';

// Links
$alignClass = 'REX_VALUE[5]' === 'label' ? ' no-center' : '';
$output .= '<div class="col'.$alignClass.'">';
    $output .= '<div class="full__content">';
        $output .= '<div class="title">REX_VALUE[2]</div>';
        $output .= '<div class="divider"></div>';
        $output .= '<div class="full__subtitle">REX_VALUE[3]</div>';

        $output .= '<div class="text paragraph">';
            $output .= $text;
        $output .= '</div>';
    $output .= '</div>';
$output .= '</div>';

$output .= '</div>';
echo $output;
//dump($output);

?>