<?php
$article = rex_article::get('REX_LINK[1]', rex_clang::getCurrentId());
if(!empty($article)) {
    $slices = rex_article_slice::getSlicesForArticle($article->getId(), rex_clang::getCurrentId());
    foreach($slices as $slice) {
        if($slice->getModuleId() === 8) {
            $title = $slice->getValue(1);
            $date = str_replace('.', ' / ', $slice->getValue(2));
            $mediaList = explode(',', $slice->getMediaList(1));

            $output = '<a href="'.$article->getUrl().'" data-cursor-dynamic>';
            $output .= '<div class="news__preview component">';
                $output .= '<div class="col">';
                    $output .= '<div class="news__meta">';
                        $output .= '<div class="news__title">'.$title.'</div>';
                        $output .= '<div class="news__divider"></div>';
                        $output .= '<div class="news__date">'.$date.'</div>';
                    $output .= '</div>';
                    $output .= '<div class="news__more"></div>';
                $output .= '</div>';

                $output .= '<div class="col">';
                    if(!empty($mediaList[0])) {
                        $output .= Simplify::getPictureTag($mediaList[0]);
                    }
                $output .= '</div>';
            $output .= '</div>';

            $output .= '</a>';
            echo $output;
            break;
        }
    }
}
?>