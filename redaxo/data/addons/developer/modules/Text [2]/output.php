<?php
$fileDownload = 'REX_MEDIA[1]';

$output = '<div class="text__full component">';
    $output .= 'REX_VALUE[id=1 output=html]';

    if(!empty($fileDownload)) {
        $output .= '<div class="download">';
            $output .= '<a data-cursor-dynamic href="/media/'.$fileDownload.'" download="download">REX_VALUE[2]</a>';
        $output .= '</div>';
    }
$output .= '</div>';

echo $output;
?>