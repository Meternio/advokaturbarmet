<?php
$output = '<div class="contact component">';
    $output .= '<div class="title">Contact</div>';
    $output .= '<div class="address__line">REX_VALUE[1]<br>REX_VALUE[2]</div>';
    $output .= '<div class="address__line">REX_VALUE[3]<br><a data-cursor-dynamic href="mailto:REX_VALUE[4]">REX_VALUE[4]</a></div>';
    $output .= !empty('REX_VALUE[5]') ? '<div class="mailbox">Postadresse: REX_VALUE[5]</div>' : '';
$output .= '</div>';
echo $output;
?>