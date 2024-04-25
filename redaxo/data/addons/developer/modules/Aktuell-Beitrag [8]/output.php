<?php
$images = !empty('REX_MEDIALIST[1]') ? explode(',', 'REX_MEDIALIST[1]') : null;
$output = '<div class="blog__post component closed">';
$output .= '<div class="preview">';
$output .= '<div class="col">';
$output .= '<div class="preview__content">';
$output .= '<div class="preview__title">REX_VALUE[1]</div>';
$output .= '<div class="preview__divider"></div>';
if(!empty('REX_VALUE[2]')) {
    $date = str_replace('.', ' / ', 'REX_VALUE[2]');
    $output .= '<div class="preview__date">DATE: ' . $date . '</div>';
}
$output .= '</div>';
$output .= '</div>';

$output .= '<div class="col">';
$output .= '<div class="media__wrapper">';
if (count($images) > 1 && !empty($images[0])) {
    $output .= '<div class="swiper-container">';
    $output .= '<div class="swiper-wrapper">';
    foreach ($images as $image) {
        $output .= '<div class="swiper-slide">';
        //$output .= '<img src="'.$image.'"'>
        $output .= Simplify::getPictureTag($image);
        $output .= '</div>';
    }
    $output .= '</div>';
    $output .= '<div class="swiper-pagination"></div>';
    $output .= '</div>';
} else {
    if(!empty($images) && !empty($images[0])) {
        $image = $images[0];
        $output .= Simplify::getPictureTag($image);
    }
}
$output .= '</div>';
$output .= '</div>';
$output .= '</div>';

$output .= '<div class="blog__content">';
$output .= '<div class="col">';
$output .= '<div class="content__title">REX_VALUE[3]</div>';
$output .= '<div class="content__text">REX_VALUE[id=4 output=html]</div>';
$output .= '</div>';

$output .= '<div class="col">';
$titleOutput = false;
foreach ($images as $image) {
    if (!empty($image)) {
        $imageCredit = rex_media::get($image)->getValue('med_credits');
    }

    if (!empty($imageCredit)) {
        if (!$titleOutput) {
            $output .= '<div class="image__credit">Image Credits</div>';
            $titleOutput = true;
        }

        $creditURL = rex_media::get($image)->getValue('med_credits_link');
        $creditString = !empty($creditURL) ? '<a href="' . Simplify::formatLink($creditURL) . '" title="Credits: ' . $imageCredit . '">@' . $imageCredit . '</a>' : '@' . $imageCredit;
        $output .= '<div class="image__credit">' . $creditString . '</div>';
    }
}

$output .= !empty('REX_VALUE[id=5 output=html]') ? '<div class="content__text">REX_VALUE[id=5 output=html]</div>' : '';

$moreLink = 'REX_VALUE[7]';
$moreURL = 'REX_VALUE[6]';

if (!empty($moreLink) && !empty($moreURL)) {
    $output .= '<div class="content__link" data-cursor-dynamic><span>READ MORE:</span><a href="' . Simplify::formatLink($moreURL) . '" target="_blank" title="' . $moreLink . '">' . $moreLink . '</a></div>';
}

$output .= '</div>';
$output .= '</div>';
$output .= '<div class="blog__more" data-cursor-dynamic></div>';
$output .= '</div>';
echo $output;
?>