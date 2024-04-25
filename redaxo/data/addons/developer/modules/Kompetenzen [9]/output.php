<?php
$tiles = rex_var::toArray('REX_VALUE[1]');
$output = '';

if (!empty($tiles)) {
    $output .= '<div class="tiles component">';
    foreach ($tiles as $tile) {
        // Tile
        $alignClass = $tile['check'] === 'label' ? ' no-center' : '';

        $output .= '<div class="tile" data-cursor-dynamic><div class="tile__title">' . $tile['tileText'] . '</div><div class="tile__more"></div></div>';
        $output .= '<div class="tile__popup">';
            $pictureTag = !empty($tile['REX_MEDIA_1']) ? Simplify::getPictureTag($tile['REX_MEDIA_1']) : '';
            $output .= '<div class="col">'.$pictureTag.'</div>';
            $output .= '<div class="col'.$alignClass.'">';
                $output .= '<div class="popup__content">';
                    $output .= '<div class="popup__title">'.$tile['tileText'].'</div>';
                    $output .= '<div class="popup__divider"></div>';
                    $output .= '<div class="popup__subtitle">'.$tile['subTitle'].'</div>';
                    $output .= '<div class="popup__text">'.$tile['text'].'</div>';
                $output .= '</div>';
                $output .= '<div class="popup__close" data-cursor-dynamic></div>';
            $output .= '</div>';
        $output .= '</div>';
        // Popup
    }
    $output .= '</div>';
}

echo $output;
?>