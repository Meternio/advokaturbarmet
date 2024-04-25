<?php
$title = REX_VALUE[1];
$text = 'REX_VALUE[id=2 output=html]';
$subtitle = REX_VALUE[5];
$previewImage = Simplify::getPictureTag('REX_MEDIA[1]');
$detailImage = !empty('REX_MEDIA[2]') ? Simplify::getPictureTag('REX_MEDIA[2]') : $previewImage;
$position = REX_VALUE[3];
$width = REX_VALUE[4];
$cv = REX_MEDIA[3];

$output = '<div class="team-member component">';
    $output .= '<div class="member-image-wrapper '. $position .' width-'.$width.'" data-hover data-cursor-static>';
                    $output .= '<div class="member-name">'.$title.'</div>';
                    $output .= '<div class="member-image">'.$previewImage.'</div>';
                    $output .= '<div class="member-more"></div>';
    $output .= '</div>';

    $output .= '<div class="member__popup">';
        $output .= '<div class="col">'.$detailImage.'</div>';

        $text = !empty($cv) ? $text . '<div class="popup__cv"><a href="/media/'.$cv.'" download="download">Download CV</a></div>' : $text;
        $output .= '<div class="col">';
            $output .= '<div class="popup__content">';
            $output .= '<div class="popup__title">'.$title.'</div>';
            $output .= !empty($subtitle) ? '<div class="popup__divider"></div>' : '';
            $output .= !empty($subtitle) ? '<div class="popup__subtitle">'.$subtitle.'</div>' : '';
            $output .= '<div class="popup__text">'.$text.'</div>';

        $output .= '</div>';

        $output .= '<div class="popup__close" data-cursor-dynamic></div>';
        $output .= '</div>';
    $output .= '</div>';

$output .= '</div>';

echo $output;
?>